<?php

use Firebase\JWT\JWT;

require('./database.php');
require("./kabeersnetwork/Storage.php");
require('./keys.php');
require('./misc.php');

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();
global $SQL_CLIENT;

$storage = new Storage();
$database = new DatabaseClient($SQL_CLIENT);
$rating_weights = array(
    'is_casting' => 0.05,
    'repeat_enabled' => 0.3,
    'player_type' => 0.2,
    'volume' => 0.3,
    'explicit_rating' => 0.6,
    'watch_percent' => 0.3,
    'viewed_artist' => 0.2,
    'times_streamed' => 0.5
);
function IndexSong()
{
    $_POST = json_decode(file_get_contents('php://input'), true);
    global $database;
    global $KEYS;
    try {
        if ($_POST['token'] == $KEYS["rsa"]["csrf_id"]) {
            echo Jsonify($database->indexSong($_POST['song']));
        } else echo Jsonify("Invalid Token");
    } catch (Exception $e) {
        echo Jsonify("Failed to Decode Token");
    }
}

function getAllIndexedSongs()
{
//    if (!$_ENV['PROD']) {
    global $database;
    $query = "SELECT * FROM `indexed_songs`";
    $results = $database->client->query($query);
    $results = $results->fetch_all(MYSQLI_ASSOC);
    $songs = [];
    foreach ($results as $r) {
        if (!is_null($r)) {
            $song = json_decode($r['yt_video_json'], true);
            if (!is_null($song)) array_push($songs, array("song" => $song, "song_id" => $song['id']));
        }
    }
    echo Jsonify($songs);
}

function getAllIndexedSongsByIds()
{
    global $database;
    $requested_songs = explode("|", $_GET['ids']);
    $sql = "SELECT * FROM `indexed_songs` WHERE `yt_video_id` IN ('" . implode("', '", $requested_songs) . "')";
    $results = $database->client->query($sql);
    if ($results) {
        $results = $results->fetch_all(MYSQLI_ASSOC);
        echo Jsonify(array_map(function ($e) {
            return json_decode($e['yt_video_json'], true);
        }, $results));
    } else echo Jsonify("An Error Occurred");
}

function saveSessionHistory()
{
    try {
        global $database;
        global $KEYS;
        $decoded = JWT::decode($_GET["token"], $KEYS["rsa"]["csrf_id"], array('HS256'));
        $_POST = json_decode(file_get_contents('php://input'), true);
        if (in_array("__kn.music.data-collection.update-rating", explode("|", $decoded->scope))) {
            $database->insertSession($_POST['session']);
        }
    } catch (Exception $e) {
        http_response_code(500);
    }
}

function getHistory()
{
    global $database;
    if (isset($_GET['user_id'])) {
        $id = $_GET['user_id'];
    } else $id = null;
    if (!isset($_GET['limit'])) $_GET['limit'] = 10;
    $history = $database->getHistory($id, $_GET['limit']);
    $listened_songs = array();
    for ($i = 0; $i < sizeof($history); $i++) {
        $song = json_decode($database->getSong($history[$i]['video_id'])['yt_video_json'], true);
        if ($song) array_push($listened_songs, array("user_id" => $history[$i]['user_id'], "rating" => $history[$i]['average_rating'], "song" => $song, "song_id" => $song['id']));
    }
    echo Jsonify($listened_songs);
}

//$songs = json_decode(file_get_contents("./tests/dataset.json"), true);
//for ($i = 0; $i < sizeof($songs); $i ++) {
//    echo Jsonify($songs[$i]['id']);
//    echo $database->indexSong($songs[$i]);
//}
//echo "__________";
function getSongRoute()
{
    try {
        global $database;
        global $KEYS;
        $decoded = JWT::decode($_GET["token"], $KEYS["rsa"]["csrf_id"], array('HS256'));
        if (in_array("__kn.music.data-collection.get-song", explode("|", $decoded->scope))) {
            echo Jsonify(json_decode($database->getSong($_GET["id"])['yt_video_json']));
        } else http_response_code(400);
    } catch (Exception $e) {
        http_response_code(500);
    }
}

function updateRating()
{
    try {
        $rating = 0;
        global $rating_weights;
        global $database;
        global $KEYS;
        $decoded = JWT::decode($_GET["token"], $KEYS["rsa"]["csrf_id"], array('HS256'));
        $_POST = json_decode(file_get_contents('php://input'), true);
        if (in_array("__kn.music.data-collection.update-rating", explode("|", $decoded->scope))) {
            foreach (array_keys($_POST) as $key) $rating += floatval($_POST[$key]) * $rating_weights[$key];
            $database->insertRating($decoded->sub, $_GET["video_id"], $_POST, $rating);
            http_response_code(200);
            echo Jsonify(array());
        } else http_response_code(400);
    } catch (Exception $e) {
        http_response_code(400);
    }
}

function getSearchHistory()
{
    try {
        global $database;
        http_response_code(200);
        echo Jsonify($database->getSearches($_GET['user_id']));
    } catch (Exception $e) {
        http_response_code(400);
    }

}

function saveSearchHistory()
{
    try {
        global $database;
        $_POST = json_decode(file_get_contents('php://input'), true);
        $database->insertSearch($_POST['search'], $_GET['user_id']);
        http_response_code(200);
    } catch (Exception $e) {
        http_response_code(400);
    }

}

function getSongStreams()
{
    global $database;
    global $KEYS;
    $decoded = JWT::decode($_GET["token"], $KEYS["rsa"]["csrf_id"], array('HS256'));
    if (in_array("__kn.music.data-collection.get-rating-details", explode("|", $decoded->scope))) {
        $_POST = json_decode(file_get_contents('php://input'), true);
        $video_id = $_POST["id"];
//        $entry_hash = md5($decoded->sub . $_POST["id"]);
        $response = $database->client->query("SELECT * FROM `watch-user-ratings` WHERE `user_id` = '$decoded->sub' AND `video_id` = '$video_id' LIMIT 1");
        $streamed = json_decode($response->fetch_assoc()["detail_json"], true);
        if (is_null($streamed)) echo Jsonify(array("times_streamed" => 1));
        else echo Jsonify(array("times_streamed" => $streamed['times_streamed']));
    }
}

function getTestToken()
{
    if (!$_ENV['PROD']) {
        echo JWT::encode(array(
            "scope" => '__kn.music.data-collection.write-watch|__kn.music.data-collection.update-rating|__kn.music.data-collection.get-song'
        ), $_ENV['CSRF_KEY']);
    }
}

