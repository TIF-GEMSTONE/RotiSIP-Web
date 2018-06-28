<?php
class Retur_model extends CI_Model {
  
  function get_table(){
        return $this->db->get("tabel_retur");
    }
    
  function get_data(){
    $query = $this->db->query("SELECT * FROM tabel_retur JOIN tabel_roti JOIN tabel_sales JOIN tabel_stok_sales WHERE tabel_retur.id_roti=tabel_roti.id_roti AND tabel_retur.id_stok_sales=tabel_stok_sales.id_stok_sales AND tabel_retur.id_sales=tabel_sales.id_sales");
    return $query->result();
  }



    function get_sales(){
    $result = array();
    $this->db->select('*');
    $this->db->from('tabel_sales');
    $this->db->order_by('nama_sales','ASC');
    $array_keys_values = $this->db->get();
        foreach ($array_keys_values->result() as $row)
        {
            $result[0]= '-Pilih Sales-';
            $result[$row->id_sales]= $row->nama_sales;
        }
        
        return $result;
  }
   function get_roti(){
    $id_sales = $this->input->post('id_sales');
    
    $result = array();
    $this->db->select('*');
    $this->db->from('tabel_stok_sales','tabel_roti');
    $this->db->where('id_roti=70007');
    $this->db->order_by('tabel_stok_sales.id_roti','ASC');

    $array_keys_values = $this->db->get();
        foreach ($array_keys_values->result() as $row)
        {
            $result[0]= '-Pilih Retur-';
            $result[$row->id_roti]= $row->nama_roti;
        }
        
        return $result;
 
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
}
?>