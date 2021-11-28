<?php

use API\SYSTEM\Router;

//test Routes 
Router::GET("/test/{token}/{id}/{name}/",function(){
    print "this just A test";
});

//users Routes 
Router::POST("/user/register",   "users@register");
Router::POST("/user/login",                                                "users@login");
Router::POST("/user/auth",                                                               "users@auth");
Router::POST("/user/get",                                                     "users@get"    );
Router::POST("/user/followers",                                                     "users@followers"    );
Router::POST("/user/search",                                                     "users@search"    );
Router::POST("/user/profile",                                                     "users@getById"    );

//posts Routes
Router::POST("/post/add",                                                    "posts@add");
Router::POST("/post/delete",                                                        "posts@delete");
Router::POST("/post/update",                                            "posts@update");
Router::POST("/post/get",                                                             "posts@getById");
Router::POST("/post/foruser",                                                             "posts@getByUser");
//Router::GET("/post/getall/{user_id}/{token}",                                                   "posts@getAll");
Router::POST("/post/feeds",                                                                     "posts@feeds");

//comments Routes
Router::POST("/comment/add",                                    "comments@add");
Router::POST("/comment/delete",                                                     "comments@delete");
Router::POST("/comment/get",                                                   "comments@get");
//messages routes
Router::POST("/message/add",                                                      "messages@add");
Router::POST("/message/get",                                                      "messages@get");
Router::POST("/message/getall",                                                   "messages@getall");
//likes Routes
Router::POST("/like/add",                                                      "likes@add");
Router::POST("/like/delete",                                                   "likes@delete");
//follows Routes
Router::POST("/follow",                                        "followers@add");
Router::POST("/unfollow",                                     "followers@delete");






