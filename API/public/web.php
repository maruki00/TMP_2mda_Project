<?php

use API\SYSTEM\Router;

Router::GET("/home/{id}/{name}/hello","users@create");
Router::GET("/users/{id}/{name}","users@create");
