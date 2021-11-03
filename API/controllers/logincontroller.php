<?php

namespace API\CONTROLLERS;
use API\SYSTEM\Controller;
use API\MODELS\usermodel;
use API\MODELS\loginmodel;

class logincontroller extends Controller{
    private $login = null;
    public static function isAuth($token){
        $login = loginmodel::where("accesstoken","=",$token);
        if($login) return true;
        else return false;    
    }
    public function login(){
        $this->login = loginmodel::where("username","=",$this->params['username'],"and",
                                  "password","=",Helper::password($this->params['password']));
        if($this->login){
            echo json_encode(array("accesstoken"=>$this->login->accessToken));
        }else{
            echo json_encode(array("Error"=>"You are not allowed..."));
        }
    }
    public function auth(){
        if(static::isAuth($this->params['token'])){
            $this->user = usersmodel::where("accesstoken","=",$this->params['token']);
            if($this->user){
                $json = json_encode($this->user);
                echo $json;
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
                echo json_encode($this->user);
            }else{
                echo json_encode(array("Error"=>"Failed to fetch this user"));
            }
        }else{
            echo json_encode(array("Error"=>"You are not allowed..."));
        }
    }
    public static function parseAccessToken($data){
        $method = "AES-256-CBC";
        $s_key = '2-mda-9';
        $s_iv = 'TMP-2-mda-9-pro';
        $key = hash('sha256', $s_key);
        $iv = substr(hash('sha256', $s_iv), 0, 16);
        $data = base64_decode($data);
        $res = openssl_decrypt($data, $method, $key, 0, $iv);
        $res = explode("%mda%",$res);
        return $res;
    }
    private function password($data){
        return hash('sha256',$data);
    }
    private function generate_accessToken($id,$user,$pass){
        $data = $id."%mda%".$user."%mda%".$pass;
        $method = "AES-256-CBC";
        $s_key = '2-mda-9';
        $s_iv = 'TMP-2-mda-9-pro';
        $key = hash('sha256', $s_key);
        $iv = substr(hash('sha256', $s_iv), 0, 16);
        $output = openssl_encrypt($data, $method, $key, 0, $iv);
        return base64_encode($output);
    }
}