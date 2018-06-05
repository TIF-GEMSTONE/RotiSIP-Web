<?php
class Retur_model extends CI_Model {
  
  function get_table(){
        return $this->db->get("tabel_retur");
    }
    
  function get_data(){
    $query = $this->db->query("SELECT * FROM tabel_retur JOIN tabel_roti JOIN tabel_sales JOIN tabel_stok_sales WHERE tabel_retur.id_roti=tabel_roti.id_roti AND tabel_retur.id_stok_sales=tabel_stok_sales.id_stok_sales AND tabel_retur.id_sales=tabel_sales.id_sales");
    return $query->result();
  }

  function get_roti(){
    $query = $this->db->query("SELECT * FROM tabel_roti WHERE id_roti=70007");
    return $query->result();
  }

    function get_sales(){
    $query = $this->db->query("SELECT * FROM tabel_sales");
    return $query->result();
  }
 
  function input($data = array()){
    return $this->db->insert('tabel_retur',$data);
  }

  function delete($id){
    $this->db->where('id_retur', $id);
        return $this->db->delete('tabel_retur');
  }
  
  function cari($nama_sales){
   $query = $this->db->query("SELECT * FROM tabel_retur JOIN tabel_roti JOIN tabel_sales WHERE tabel_retur.id_roti=tabel_roti.id_roti AND tabel_retur.id_sales=tabel_sales.id_sales AND tabel_sales.nama_sales = '$nama_sales'");
    return $query->result();
  }

}
?>