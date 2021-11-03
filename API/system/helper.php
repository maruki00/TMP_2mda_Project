<?php
namespace API\SYSTEM;
class Helper{
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
    public function password($data){
        return hash('sha256',$data);
    }
    public function generate_accessToken($id,$user,$pass){
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