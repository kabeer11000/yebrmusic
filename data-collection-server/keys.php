<?php
$_database_prod = explode("|", $_SERVER['database_prod']);
$_database_dev = explode("|", $_SERVER['database_dev']);

$KEYS = array(
    "database_dev" => array(
        "password" => $_database_dev[0],
        "username" => $_database_dev[1],
        "host" => $_database_dev[2],
        "name" => $_database_dev[3]
    ),
    "database_prod" => array(
        "password" => $_database_prod[0],
        "username" => $_database_prod[1],
        "host" => $_database_prod[2],
        "name" => $_database_prod[3]
    ),
    "rsa" => array(
        "kauth_public" => <<<EOD
-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCqC8QOAygPkks0h7iRVg7FNNVf
AlQhYjnK9vB69dw9TOG+DyjSuFUnpedEv0YfbGIC3dGqc5YHfqZPDy4U5Jj+H5/g
FzSdiI7AIauD5OLDCqBy6nyMC23GesMPibgaiEylvryreGmkfANEJSCtceVTjIHn
/MEgvdBd6oZAEkv0XQIDAQAB
-----END PUBLIC KEY-----
EOD,
        "csrf_id" => $_SERVER['csrf_id']
    )
);
?>
