<?php
if(!isset($_GET['user']))
    die("Error");

echo "hello world ".$_GET['user'];