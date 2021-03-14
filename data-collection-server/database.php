<?php
include("./keys.php");

$SQL_CLIENT = new mysqli($keys["database_dev"]["host"], $keys["database_dev"]["username"], $keys["database_dev"]["password"], $keys["database_dev"]["name"]);
