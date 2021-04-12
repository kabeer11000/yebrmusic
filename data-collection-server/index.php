<?php

use Bramus\Router\Router;

require_once './vendor/autoload.php';
error_reporting(0);
//E_ALL
//use Firebase\JWT\JWT;
// Create Router instance
$router = new Router();
header('Access-Control-Allow-Origin: *');
require('./controllers.php');

//Route::add('/add-watch', 'addWatch', 'post');
//Route::add('/get-song', 'getSongRoute', 'get');
//Route::add('/update-rating', 'updateRating' , 'post');
//Route::add('/get-test-token', 'getTestToken', 'get');
$router->setBasePath('/api');
$router->post('/index-song', 'IndexSong');
$router->get('/get-song', 'getSongRoute');
$router->post('/update-rating', 'updateRating');
$router->get('/get-test-token', 'getTestToken');
$router->mount('/history', function () use ($router) {
    $router->post('/create-watch', 'getSongStreams');
    $router->get('/get-search-history', 'getSearchHistory');
    $router->get('/get-history', 'getHistory');
    $router->post('/save-search', 'saveSearchHistory');
    $router->post('/save-session', 'saveSessionHistory');
});

$router->mount('/details', function () use ($router) {
    $router->post('/streams', 'getSongStreams');
    $router->get('/get-indexed-songs', 'getAllIndexedSongs');
    $router->get('/get-indexed-songs-by-ids', 'getAllIndexedSongsByIds');
});
//
//$router->mount('/api', function () use ($router) {
//
//    $router->get('/details-streams', 'getSongStreams');
//
//});
// Include router class
//require ('./kabeersnetwork/Router.php');

//include('./misc.php');
//include('./database.php');
//include('./kabeersnetwork/Storage.php');
//include('./keys.php');
//
//$storage = new Storage();
//$client = new DatabaseClient($SQL_CLIENT);
//$rating_weights = array(
//    'is_casting' => 0.05,
//    'repeat_enabled' => 0.3,
//    'player_type' => 0.2,
//    'volume' => 0.3,
//    'explicit_rating' => 0.6,
//    'watch_percent' => 0.3,
//    'viewed_artist' => 0.2,
//    'times_streamed' => 0.7
//);
// Add base route (startpage)
//Route::add('/get-csrf', function () use ($storage, $KEYS) {
////    try {
////        $token = $_POST['token'];
////        JWT::decode($token, $KEYS['rsa']['csrf_id'], array('HS256'));
////        $id = md5(uniqid());
////        $storage->set($id, 'null');
////        echo Jsonify(array(
////            '$id' => $id,
////        ));
////    } catch (Exception $exception) {
////        echo Jsonify('An Error Occured');
////    }
//}, 'post');
//Route::add('/add-watch', 'addWatch', 'post');
//Route::add('/get-song', 'getSongRoute', 'get');
//Route::add('/update-rating', 'updateRating' , 'post');
//Route::add('/get-test-token', 'getTestToken', 'get');
//
//Route::run('/api');

$router->run();
