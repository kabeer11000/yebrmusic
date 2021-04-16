<?php

/**
 * @param $text
 * @return false|string
 */
function Jsonify($text)
{
    header('Content-Type: application/json');
    header('Access-Control-Allow-Origin: *');
    return json_encode($text, JSON_PRETTY_PRINT);
}

/**
 * Class DatabaseClient
 */
class DatabaseClient
{
    public $client = null;

    /**
     * DatabaseClient constructor.
     * @param $client
     */
    function __construct($client)
    {
        $this->client = $client;
    }

    /**
     * @param $details
     * @param $user_id
     */
    function insertSearch($details, $user_id)
    {
        $entry_hash = md5(uniqid());
        $search_query = $details['query'];
        $details = json_encode($details);

        $query = "INSERT INTO `search-queries`(`entry`, `query`, `detail_json`, `user_id`) VALUES ('$entry_hash', '$search_query', '$details', '$user_id')";
        $this->client->query($query);
    }

    /**
     * @param $user_id
     * @return array
     */
    function getSearches($user_id)
    {
        $results = $this->client->query("SELECT * FROM `search-queries` WHERE `user_id` = '$user_id'");
        $results = $results->fetch_all(MYSQLI_ASSOC);
        $a = [];
        for ($i = 0; $i < count($results); $i++) {
            array_push($a, array(
                "entry" => $results[$i]["entry"],
                "query" => $results[$i]["query"],
                "detail_json" => json_decode($results[$i]['detail_json'], true),
                "user_id" => $results[$i]['user_id']
            ));
        }
        return $a;
    }

    /**
     * @param $session
     * @return mixed
     */
    function insertSession($session)
    {
        $session_encoded = $session;
        $session = json_decode($session);
        $session_id = $session['id'];
        $exists = $this->client->query("SELECT * FROM `user_sessions` WHERE `session_id` = '$session_id' LIMIT 1;")->num_rows;
        if ($exists !== 0) $query = "UPDATE `user_sessions` SET `json`='$session_encoded' WHERE `id` = '$session_id'";
        else $query = "INSERT INTO `user_sessions`(`id`, `json`) VALUES ('$session_id', '$session_encoded')";
        return $this->client->query($query);
    }

    /**
     * @param $id
     * @return null
     */
    function getSong($id)
    {
        $query = "SELECT * FROM `indexed_songs` WHERE `yt_video_id` = '$id' LIMIT 1;";
        $result = $this->client->query($query);
        if (!is_null($result)) return $result->fetch_assoc();
        else return null;
    }

    /**
     * @param $user_id
     * @param $limit
     * @return mixed
     */
    function getHistory($user_id, $limit)
    {

        $limit = intval($limit);
        if (!is_null($user_id)) $query = "SELECT * FROM `watch-user-ratings` WHERE `user_id` = '$user_id' LIMIT $limit;";
        else $query = "SELECT * FROM `watch-user-ratings`;";
        $results = $this->client->query($query);
        return $results->fetch_all(MYSQLI_ASSOC);
    }

    /**
     * @param $song
     * @return string
     */
    function indexSong($song)
    {
        try {
            $video_id = $song['id'];
            $channel_id = $song['channelId'];
            $title = $song["snippet"]["title"];
            $song_encoded = json_encode($song);
            $exists = $this->client->query("SELECT * FROM `indexed_songs` WHERE `yt_video_id` = '$video_id' LIMIT 1;")->num_rows;
            if ($exists !== 0) {
//                http_response_code(409);
                return "Already Exists";
            } else {
                $query = "INSERT INTO `indexed_songs`(`yt_video_id`, `yt_channel_id`, `yt_video_title`, `yt_video_json`) VALUES ('$video_id', '$channel_id', '$title', '$song_encoded')";
                $this->client->query($query);
                http_response_code(200);
                return $song;
            }
        } catch (Exception $e) {
            http_response_code(500);
            return "An Error Occurred";
        }
    }

    /**
     * @param $song
     * @return Exception
     * @deprecated
     */
    function _indexSong($song)
    {
        try {
            $video_id = $song['id'];
            $channel_id = $song['channelId'];
            $title = $song["snippet"]["title"];
            $song_encoded = json_encode($song);
            $time = time();
//            $query = "REPLACE INTO `indexed_songs` SET `timestamp` = '$time', `yt_video_id` = '$video_id', `yt_channel_id` = '$channel_id', `yt_video_title` = '$title', `yt_video_json` = '$song_encoded';";
            $query = "INSERT IGNORE INTO `indexed_songs` SET `timestamp` = '$time', `yt_video_id` = '$video_id', `yt_channel_id` = '$channel_id', `yt_video_title` = '$title', `yt_video_json` = '$song_encoded';";
            $this->client->query($query);
            return $song;
        } catch (Exception $e) {
            return $e;
        }
    }

    /**
     * @param $user_id
     * @param $video_id
     * @param $post
     * @param $average
     */
    function insertRating($user_id, $video_id, $post, $average)
    {
        try {
            $entry_hash = md5($user_id . $video_id);
            $detail_json = json_encode($post);
            $query = "INSERT INTO `watch-user-ratings` (`user_id`, `entry_hash`, `video_id`, `average_rating`, `detail_json`) VALUES ('$user_id', '$entry_hash', '$video_id', $average, '$detail_json') ON DUPLICATE KEY UPDATE `average_rating` = $average, `detail_json` = '$detail_json';";
            $this->client->query($query);
        } catch (Exception $e) {
            echo "Error";
        }
    }
}
