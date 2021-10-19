<?php

use API\SYSTEM\Router;

//test Routes 
Router::GET("/test/{token}/{id}/{name}/",function(){
    print "this just A test";
});

//users Routes 
Router::GET("/user/register/{username}/{password}/{fullname}/{address_email}/{phone_number}","users@register");
Router::GET("/user/login/{username}/{password}",                                             "users@login");
Router::GET("/user/auth/{token}",                                                            "users@auth");
Router::GET("/user/get/{username}",                                                           "users@get");

//posts Routes
Router::GET("/post/add/{post_body}/{user_id}",                          "posts@add");
Router::GET("/post/delete/{id}",                                        "posts@delete");
Router::GET("/post/update/{id}/{post_body}/{user_id}",                  "posts@update");
Router::GET("/post/get/{id}",                                           "posts@getById");
Router::GET("/post/getall/{id}",                                        "posts@getAll");

//comments Routes
Router::GET("/comment/add/{comment_body}/{user_id}/{post_id}",          "comments@add");
Router::GET("/comment/delete/{id}",                                     "comments@delete");
Router::GET("/comment/update/{id}/{comment_body}/{user_id}/{post_id}",  "comments@update");
Router::GET("/comment/get/{post_id}",                                   "comments@get");

//likes Routes
Router::GET("/like/add/{user_id}/{post_id}",                "likes@add");
Router::GET("/like/delete/{user_id}/{post_id}",             "likes@delete");
Router::GET("/like/count/{post_id}",                        "likes@count");


//follows Routes
Router::GET("/follow/add/{follower_from_user_id}/{followed_to_user_id}","followers@add");
Router::GET("/follow/delete/{follower_from_user_id}/{followed_to_user_id}","followers@delete");
//





