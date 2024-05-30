<?php

class db
{
    public function __construct()
    {
        $host = "localhost";
        $dbname = "maremseafood";
        $username = "root";
        $password = "";

        $this->db = new PDO("mysql:host={$host};dbname={$dbname}", $username, $password);
        $this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }

}

?>