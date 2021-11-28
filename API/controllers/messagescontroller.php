<?php


namespace API\CONTROLLERS;
use API\MODELS\messagesmodel;
use API\SYSTEM\Controller;
use API\SYSTEM\Helper;

class messagescontroller extends Controller{
    private $message;
    //id
    //message
    //messaged_date
    //user_id_from
    //user_id_to

    public function add(){
        if(isset($_POST['token'])&&isset($_POST['message'])&&isset($_POST['user_id'])){
            if(userscontroller::isAuth($_POST['token'])){
                $data = Helper::parseAccessToken($_POST['token']);
                $this->message=new messagesmodel();
                $this->message->id = 1;
                $this->message->message = $_POST['message'];
                $this->message->messaged_date = Helper::now();
                $this->message->user_id_from = $data[0];
                $this->message->user_id_to = $_POST['user_id'];
                $res = $this->message->create();
                if($res){
                    echo json_encode(array("Success"=>"message Added Successfully"));
                }else{
                    echo json_encode(array("Error"  =>"Failed to Add Message"));
                }
            }else{
                echo json_encode(array("Error"=>"You are not allowed..."));
            }
        }else{
            echo json_encode(array("Error"=>"Invalide Data..."));
        }
    }

    public function getall(){
        if(isset($_POST['token'])){
            if(userscontroller::isAuth($_POST['token'])){
                $data = Helper::parseAccessToken($_POST['token']);
                $this->message=messagesmodel::exec("select distinct *,(select fullname from users where id = m.user_id_from) as user,
                  (select imagepath from users where id= m.user_id_from) as userimage from messages m where user_id_from!=".$data[0]." group by user_id_from,user_id_from desc");
                if($this->message){
                    echo json_encode($this->message);
                }else{
                    echo json_encode(array("Error"  =>"Failed to fetch Message"));
                }
            }else{
                echo json_encode(array("Error"=>"You are not allowed..."));
            }
        }else{
            echo json_encode(array("Error"=>"Invalide Data..."));
        }
    }

    public function get(){
        if(isset($_POST['token']) && isset($_POST['user_id'])){
            if(userscontroller::isAuth($_POST['token'])){
                $data = Helper::parseAccessToken($_POST['token']);
                $this->message=messagesmodel::exec("select *,(select fullname from users where id   =".$_POST['user_id'].") as user
                                                    ,(select imagepath from users where id=".$_POST['user_id'].") as userimage 
                                                    from messages where (user_id_from=".$data[0]." and user_id_to=".$_POST['user_id'].")or
                                                    (user_id_from=".$_POST['user_id']." and user_id_to=".$data[0].") order by id DESC"); 
                if($this->message){
                    echo json_encode($this->message);
                }else{
                    echo json_encode(array("Error"  =>"Failed to fetch Messages"));
                }
            }else{
                echo json_encode(array("Error"=>"You are not allowed..."));
            }
        }else{
            echo json_encode(array("Error"=>"Invalide Data..."));
        }
    }
}

