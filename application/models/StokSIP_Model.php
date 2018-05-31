<?php
class StokSIP_Model extends CI_Model {
  
  function get_table(){
        return $this->db->get("tabel_stok_pusat");
    }
    
  function get_data(){
    $query = $this->db->query("SELECT * FROM tabel_stok_pusat JOIN tabel_roti WHERE tabel_stok_pusat.id_roti=tabel_roti.id_roti");
    return $query->result();
  }

  function get_roti(){
    $query = $this->db->query("SELECT * FROM tabel_roti");
    return $query->result();
  }
 
  function input($data = array()){
    return $this->db->insert('tabel_stok_pusat',$data);
  }

  function delete($id){
    $this->db->where('id_stok_pusat', $id);
        return $this->db->delete('tabel_stok_pusat');
  }
 
}
?>