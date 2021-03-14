<?php
require_once './vendor/autoload.php';

use Firebase\JWT\JWT;

// Include router class
include('./kabeersnetwork/Router.php');
include('./misc.php');
include('./database.php');

// Add base route (startpage)
Route::add('/', function () {

    $privateKey = <<<EOD
-----BEGIN RSA PRIVATE KEY-----
MIICXAIBAAKBgQC8kGa1pSjbSYZVebtTRBLxBz5H4i2p/llLCrEeQhta5kaQu/Rn
vuER4W8oDH3+3iuIYW4VQAzyqFpwuzjkDI+17t5t0tyazyZ8JXw+KgXTxldMPEL9
5+qVhgXvwtihXC1c5oGbRlEDvDF6Sa53rcFVsYJ4ehde/zUxo6UvS7UrBQIDAQAB
AoGAb/MXV46XxCFRxNuB8LyAtmLDgi/xRnTAlMHjSACddwkyKem8//8eZtw9fzxz
bWZ/1/doQOuHBGYZU8aDzzj59FZ78dyzNFoF91hbvZKkg+6wGyd/LrGVEB+Xre0J
Nil0GReM2AHDNZUYRv+HYJPIOrB0CRczLQsgFJ8K6aAD6F0CQQDzbpjYdx10qgK1
cP59UHiHjPZYC0loEsk7s+hUmT3QHerAQJMZWC11Qrn2N+ybwwNblDKv+s5qgMQ5
5tNoQ9IfAkEAxkyffU6ythpg/H0Ixe1I2rd0GbF05biIzO/i77Det3n4YsJVlDck
ZkcvY3SK2iRIL4c9yY6hlIhs+K9wXTtGWwJBAO9Dskl48mO7woPR9uD22jDpNSwe
k90OMepTjzSvlhjbfuPN1IdhqvSJTDychRwn1kIJ7LQZgQ8fVz9OCFZ/6qMCQGOb
qaGwHmUK6xzpUbbacnYrIM6nLSkXgOAwv7XXCojvY614ILTK3iXiLBOxPu5Eu13k
eUz9sHyD6vkgZzjtxXECQAkp4Xerf5TGfQXGXhxIX52yH+N2LtujCdkQZjXAsGdm
B2zNzvrlgRmgBrklMTrMYgm1NPcW+bRLGcwgW2PTvNM=
-----END RSA PRIVATE KEY-----
EOD;

    $publicKey = <<<EOD
-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC8kGa1pSjbSYZVebtTRBLxBz5H
4i2p/llLCrEeQhta5kaQu/RnvuER4W8oDH3+3iuIYW4VQAzyqFpwuzjkDI+17t5t
0tyazyZ8JXw+KgXTxldMPEL95+qVhgXvwtihXC1c5oGbRlEDvDF6Sa53rcFVsYJ4
ehde/zUxo6UvS7UrBQIDAQAB
-----END PUBLIC KEY-----
EOD;

    $payload = array(
        "iss" => "example.org",
        "aud" => "example.com",
        "iat" => 1356999524,
        "nbf" => 1357000000
    );

    $jwt = JWT::encode($payload, $privateKey, 'RS256');
    echo "Encode:\n" . print_r($jwt, true) . "\n";

    $decoded = JWT::decode($jwt, $publicKey, array('RS256'));
});
Route::add('/-', function () {
    include('./keys.php');
//    echo Jsonify($keys["rsa"]["private"]);
    $token = JWT::encode(array("kabeer" => "PORNHUB"), $keys["rsa"]["private"], 'RS256');
    $decoded = JWT::decode($token, $keys["rsa"]["public"], array('RS256'));
    echo Jsonify(array(
        "token" => $token,
        "decoded" => $decoded
    ));
//    echo Jsonify('Kabeer\'s Music API Server - For Jobs: a2FiZWVyc25ldHdvcmtAZ21haWwuY29t (base64)');
}, 'get');
Route::add('/', function () {
//    $song = $_POST["song"];
//    $token = explode(" ", $_SERVER["authorization"])[1];
//    $decoded = JWT::decode($token, $keys["rsa"]["kauth_public"], array('RS256'));
//
//    $SQL_CLIENT -> query("SELECT * FROM `listening-history-ratings` WHERE `id`");
//    echo Jsonify('Kabeer\'s Music API Server - For Jobs: a2FiZWVyc25ldHdvcmtAZ21haWwuY29t (base64)');
}, 'post');


// Simple test route that simulates static html file
Route::add('/test.html', function () {
    echo 'Hello from test.html';
});


// Post route example
Route::add('/contact-form', function () {
    echo '<form method="post"><input type="text" name="test" /><input type="submit" value="send" /></form>';
}, 'get');

// Post route example
Route::add('/contact-form', function () {
    echo 'Hey! The form has been sent:<br/>';
    print_r($_POST);
}, 'post');

// Accept only numbers as parameter. Other characters will result in a 404 error
Route::add('/foo/([0-9]*)/bar', function ($var1) {
    echo $var1 . ' is a great number!';
});

Route::run('/api');
