<?php


namespace API\CONTROLLERS;
use API\SYSTEM\Controller;
use API\MODELS\usersmodel;

class userscontroller extends Controller{
    private $user = null;
    public function register(){
        $this->user = new usersmodel;
        $this->user->id = 1;
        $this->user->username = $this->params['username'];
        $this->user->password = $this->password($this->params['password']);
        $this->user->accessToken = $this->generate_accessToken($this->user->username,$this->user->password);
        $this->user->fullname = $this->params['fullname'];
        $this->user->address_email = $this->params['address_email'];
        $this->user->phone_number = $this->params['phone_number'];
        $this->user->last_access = date("d/m/Y");
        $this->user->role = 1;
        $res = $this->user->create();
        if($res){
            echo json_encode(array("accesstoken"=>$this->user->accessToken));
        }else{
            echo json_encode(array("message"=>"Failed to register"));
        }
    }
    public function login(){
        $this->user = usersmodel::where("username","=",$this->params['username'],"and",
                                  "password","=",$this->password($this->params['password']));
        if($this->user){
            echo json_encode($this->user);
        }else{
            echo json_encode(array("message"=>"Failed to login"));
        }
    }
    public function auth(){
        $this->user = usersmodel::where("accesstoken","=",$this->params['token']);
        $this->user->password="";
        if($this->user){
            echo json_encode($this->user);
        }else{
            echo json_encode(array("message"=>"Failed to auth"));
        }
    }
    public function get(){
        $this->user = usersmodel::where("username","=",$this->params['username']);
        if($this->user){
            echo json_encode($this->user);
        }else{
            echo json_encode(array("message"=>"Failed to fetch this user"));
        }
    }
    private function parseAccessToken($data){
        $method = "AES-256-CBC";
        $s_key = '2-mda-9';
        $s_iv = 'TMP-2-mda-9-pro';
        $key = hash('sha256', $s_key);
        $iv = substr(hash('sha256', $s_iv), 0, 16);
        $res = openssl_decrypt($data, $method, $key, 0, $iv);
        $res = explode("%mda%",$res);
        return $res;
    }
    private function password($data){
        return hash('sha256',$data);
    }
    private function generate_accessToken($user,$pass){
        $data = $user."%mda%".$pass;
        $method = "AES-256-CBC";
        $s_key = '2-mda-9';
        $s_iv = 'TMP-2-mda-9-pro';
        $key = hash('sha256', $s_key);
        $iv = substr(hash('sha256', $s_iv), 0, 16);
        $output = openssl_encrypt($data, $method, $key, 0, $iv);
        return $output;
    }
    private function check_accessToken(){
        $this->user = new usersmodel();
    }
}