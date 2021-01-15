<?php 

class Database{
    public static function connect(){
        $db = new mysqli('localhost', 'root', '', 'berfont');
        $db->query("SET NAMES 'utf8'");
        return $db;
    }
}


?>