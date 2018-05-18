<?php
class Pesanan_model extends CI_Model {
  
  function get_table(){
        return $this->db->get("tabel_pesanan");
    }
    
  function get_data(){
    $query = $this->db->query("SELECT * FROM tabel_pesanan JOIN tabel_roti JOIN tabel_sales WHERE tabel_pesanan.id_roti=tabel_roti.id_roti AND tabel_pesanan.id_sales=tabel_sales.id_sales");
    return $query->result();
  }
  
  function get_roti(){
    $query = $this->db->query("SELECT * FROM tabel_roti");
    return $query->result();
  }
  
  function get_sales(){
    $query = $this->db->query("SELECT * FROM tabel_sales");
    return $query->result();
  }
  
  function get_data_edit($id){
    $query = $this->db->query("SELECT * FROM tabel_pesanan WHERE id_pesan = '$id'");
    return $query->result_array();
  }
  
  function input($data = array()){
    return $this->db->insert('tabel_pesanan',$data);
  }
  
  function delete($id){
    $this->db->where('id_pesan', $id);
        return $this->db->delete('tabel_pesanan');
  }
  
  function update($data = array(),$id){
    $this->db->where('id_pesan',$id);
    return $this->db->update('tabel_pesanan',$data);
  }
}
?>