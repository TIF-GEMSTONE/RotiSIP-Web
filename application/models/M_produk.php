<?php
class M_produk extends CI_Model {
  public function __construct() {
        parent::__construct();
  }

  public function input($data){
    try{
      $this->db->insert('tabel_roti', $data);
      return true;
    }catch(Exception $e){
    }
  }

}
?>
