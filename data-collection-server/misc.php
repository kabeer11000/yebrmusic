<?php

function Jsonify($text)
{
    header('Content-Type: application/json');
    return json_encode($text);
}
