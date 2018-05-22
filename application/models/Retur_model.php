<?php
class Retur_model extends CI_Model {
  
  function get_table(){
        return $this->db->get("tabel_retur");
    }
    
  function get_data(){
    $query = $this->db->query("SELECT * FROM tabel_retur");
    return $query->result();
  }
  
  function get_detail(){
    $query = $this->db->query("SELECT * JOIN tabel_roti WHERE tabel_retur.id_roti=tabel_roti.id_roti");
    return $query->result();
  }
  
  
  function input($data = array()){
    return $this->db->insert('tabel_retur',$data);
  }
  
  function delete($id){
    $this->db->where('id_retur', $id);
        return $this->db->delete('tabel_retur');
  }
  
}
?>