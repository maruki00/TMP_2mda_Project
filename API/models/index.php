<?php
    header('HTTP/1.0 403 Forbidden');
    die(json_encode(array('message' => "You are not allowed, 403 Forbidden.....")));