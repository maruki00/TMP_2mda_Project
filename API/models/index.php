<?php
    header('HTTP/1.0 403 Forbidden');
    die(json_encode(array('Error' => "You are not allowed, <br>403 Forbidden.....")));
