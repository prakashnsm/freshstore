<?php
$dbURL = parse_url(getenv("CLEARDB_DATABASE_URL"));


define('_DB_SERVER_', $dbURL['host']);
define('_DB_NAME_', substr($dbURL["path"], 1));
define('_DB_USER_', $dbURL['user']);
define('_DB_PASSWD_', $dbURL['pass']);
define('_DB_PREFIX_', 'fs_');
?>