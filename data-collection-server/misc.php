<?php

function Jsonify($text)
{
    header('Content-Type: application/json');
    header('Access-Control-Allow-Origin: *');
    return json_encode($text);
}

class DatabaseClient
{
    public $client = null;

    function __construct($client)
    {
        $this->client = $client;
    }

    function getSong($id)
    {
        $query = "SELECT *  FROM `watched-songs` WHERE `yt_video_id` = '$id' LIMIT 1;";
        $result = $this->client->query($query);
        return $result->fetch_assoc();
    }

    function indexSong($song)
    {
        try {
            $video_id = $song['id'];
            $channel_id = $song['channelId'];
            $title = $song["snippet"]["title"];
            $song_encoded = json_encode($song);
            $exists = $this->client->query("SELECT * FROM `indexed_songs` WHERE `yt_video_id` = '$video_id' LIMIT 1;")->fetch_assoc();
            if (isset($exists) && !empty($exists)) {
                http_response_code(409);
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


class Song
{
    private $song;
    private $title;
    private $id;
    private $channel_id;
    private $user_id;
    private $database_client;

    function __construct($user_id, $song, $client)
    {
        $this->user_id = $user_id;
        $this->database_client = $client;
        $this->song = $song;
        $this->title = $song["snippet"]["title"];
        $this->channel_id = $song["channelId"];
        $this->id = $song["id"];
    }

    function save()
    {
        return $this->database_client->insertSong($this->user_id, $this->song);
    }
}
