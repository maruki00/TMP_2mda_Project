<?php
namespace API\CONTROLLERS;
use API\SYSTEM\Controller;
use API\MODELS\usersmodel;
use API\SYSTEM\Helper;
class userscontroller extends Controller{
    private $user = null;
    public function register(){
        $this->user = usersmodel::last();
        if(!this->user){
            $this->user = new userModel();
            $this->user->id = 1;
        }
        $this->user->id = 1;//usersmodel::last()->id?(int)usersmodel::last()->id+1:1;
        $this->user->username = $this->params['username'];
        $this->user->password = Helper::password($this->params['password']);
        $this->user->accessToken = Helper::generate_accessToken($this->user->id,
                                                                $this->user->username,
                                                                $this->user->password);
        $this->user->fullname = $this->params['fullname'];
        $this->user->address_email = $this->params['address_email'];
        $this->user->phone_number = $this->params['phone_number'];
        $this->user->last_access = date("d/m/Y");
        $this->user->role = 1;
        $res = $this->user->create();                                             
        if($res){
            echo json_encode(array("accesstoken"=>$this->user->accessToken));
        }else{
            echo json_encode(array("Error"=>"Failed to register"));
        }
    }
    public function login(){
        $this->user = usersmodel::where("username","=",$this->params['username'],"and",
                                  "password","=",Helper::password($this->params['password']));
        if($this->user){
               echo json_encode(array(
                    "id"=>           $this->user[0]->id,
                    "username"=>     $this->user[0]->username,
                    "fullname"=>     $this->user[0]->fullname,
                    //"address_email"=>$this->user[0]->address_email,
                    //"phone_number"=> $this->user[0]->phone_number,

                )); 
        }else{
            echo json_encode(array("Error"=>"You are not allowed..."));
        }
    }
    public function profile(){
        $this->user = usersmodel::where("accesstoken","=",$this->params['token']));
        if($this->user){
               echo json_encode(array(
                    "id"=>           $this->user[0]->id,
                    "username"=>     $this->user[0]->username,
                    "fullname"=>     $this->user[0]->fullname,
                    "address_email"=>$this->user[0]->address_email,
                    "phone_number"=> $this->user[0]->phone_number
                )); 
        }else{
            echo json_encode(array("Error"=>"You are not allowed..."));
        }
    }
    public static function isAuth($token){
        $user = usersmodel::where("accesstoken","=",$token);
        if($user) return true;
        else return false;    
    }
    public function auth(){
        if(static::isAuth($this->params['token'])){
            $this->user = usersmodel::where("accesstoken","=",$this->params['token']);
            if($this->user){
               echo json_encode(array(
                    "id"=>           $this->user[0]->id,
                    "username"=>     $this->user[0]->username,
                    "fullname"=>     $this->user[0]->fullname,
                    //"address_email"=>$this->user[0]->address_email,
                    //"phone_number"=> $this->user[0]->phone_number,
                ));
            }else{
                echo json_encode(array("Error"=>"Failed to auth"));
            }
        }else{
            echo json_encode(array("Error"=>"You are not allowed..."));
        }
    }
    public function get(){
        if(static::isAuth($this->params['token'])){
            $this->user = usersmodel::where("username","=",$this->params['username']);
            if($this->user){
               echo json_encode(array(
                    "id"=>           $this->user[0]->id,
                    "username"=>     $this->user[0]->username,
                    "fullname"=>     $this->user[0]->fullname,
                    //"address_email"=>$this->user[0]->address_email,
                    //"phone_number"=> $this->user[0]->phone_number,

                ));
            }else{
                echo json_encode(array("Error"=>"Failed to fetch this user"));
            }
        }else{
            echo json_encode(array("Error"=>"You are not allowed..."));
        }
    }
    
}
