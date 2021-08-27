<?php

use Bramus\Router\Router;

require_once './vendor/autoload.php';
error_reporting(0);

$router = new Router();
header('Access-Control-Allow-Origin: *');

require('./controllers.php');

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

$router->run();
