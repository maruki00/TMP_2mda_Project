<?php

use API\SYSTEM\Router;

//test Routes 
Router::GET("/test/{token}/{id}/{name}/",function(){
    print "this just A test";
});

//users Routes 
Router::GET("/user/register/{username}/{password}/{fullname}/{address_email}/{phone_number}",   "users@register");
Router::GET("/user/login/{username}/{password}",                                                "users@login");
Router::GET("/user/auth/{token}",                                                               "users@auth");
Router::GET("/user/get/{username}/{token}",                                                     "users@get"    );

//posts Routes
Router::GET("/post/add/{post_body}/{token}",                                                    "posts@add");
Router::GET("/post/delete/{id}/{token}",                                                        "posts@delete");
Router::GET("/post/update/{id}/{post_body}/{token}",                                            "posts@update");
Router::GET("/post/get/{id}/{token}",                                                           "posts@getById");
Router::GET("/post/getall/{id}/{token}",                                                        "posts@getAll");

//comments Routes
Router::GET("/comment/add/{comment_body}/{post_id}/{token}",                                    "comments@add");
Router::GET("/comment/delete/{id}/{token}",                                                     "comments@delete");
Router::GET("/comment/update/{id}/{comment_body}/{post_id}/{token}",                            "comments@update");
Router::GET("/comment/get/{post_id}/{token}",                                                   "comments@get");

//likes Routes
Router::GET("/like/add/{post_id}/{token}",                                                      "likes@add");
Router::GET("/like/delete/{post_id}/{token}",                                                   "likes@delete");
Router::GET("/like/count/{post_id}/{token}",                                                    "likes@count");


//follows Routes
Router::GET("/follow/add/{followed_to_user_id}/{token}",                                        "followers@add");
Router::GET("/follow/delete/{followed_to_user_id}/{token}",                                     "followers@delete");
//





