<?php
class Sales_model extends CI_Model {
  public function __construct() {
        parent::__construct();
  }

  public function input($data){
    try{
      $this->db->insert('tabel_sales', $data);
      return true;
    }catch(Exception $e){
    }
  }

}
?>
