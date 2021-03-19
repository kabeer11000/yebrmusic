<?php
include("./keys.php");
global $KEYS;
$SQL_CLIENT = new mysqli($KEYS["database_dev"]["host"], $KEYS["database_dev"]["username"], $KEYS["database_dev"]["password"], $KEYS["database_dev"]["name"]);
