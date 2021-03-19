<?php

use Firebase\JWT\JWT;

require('./database.php');
require("./kabeersnetwork/Storage.php");
require('./keys.php');
require('./misc.php');
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
    global $database;
    global $KEYS;
    try {
        $token = $_POST["token"];
        echo "REQUEST";
//        if (strcmp($token, $KEYS["rsa"]["csrf_id"])) {
        $song = json_decode($_POST['song'], true);
        echo Jsonify($database->indexSong($song));
//        } else echo Jsonify("Invalid Token");
    } catch (Exception $e) {
        echo Jsonify("Failed to Decode Token");
    }
}

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
        if (in_array("__kn.music.data-collection.update-rating", explode("|", $decoded->scope))) {
            foreach (array_keys($_POST) as $key) $rating += floatval($_POST[$key]) * $rating_weights[$key];
            $database->insertRating($_GET["user_id"], $_GET["video_id"], $_POST, $rating);
            http_response_code(200);
        } else http_response_code(400);
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
        $entry_hash = md5($decoded->sub . $_POST["id"]);
        $response = $database->client->query("SELECT * FROM `watch-user-ratings` WHERE `entry_hash`= '$entry_hash' LIMIT 1");
        $streamed = json_decode($response->fetch_assoc()["detail_json"], true);
        if (is_null($streamed)) echo Jsonify(0);
        else echo Jsonify($streamed);
    }
}

function getTestToken()
{
    echo JWT::encode(array(
        "scope" => '__kn.music.data-collection.write-watch|__kn.music.data-collection.update-rating|__kn.music.data-collection.get-song'
    ), "Vy0ShK6HqSwpONfMC1GtlQTFdZf0dnmSkqTCs0rNWpVtFB9hBsE8MUisUoUyYHOWH8WcuIHpZHcaVDqO");
}

