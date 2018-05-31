<?php 
class StokSales_Model extends CI_Model {
	
	function get_table(){
        return $this->db->get("tabel_stok_sales");
    }
    
	function get_data(){
		$query = $this->db->query("SELECT * FROM tabel_stok_sales JOIN tabel_roti JOIN tabel_sales WHERE tabel_stok_sales.id_roti=tabel_roti.id_roti AND tabel_stok_sales.id_sales=tabel_sales.id_sales");
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

   function input($data = array()){
    return $this->db->insert('tabel_stok_sales',$data);
  }

function cari($nama_sales){
    $query = $this->db->query("SELECT * FROM tabel_stok_sales JOIN tabel_sales JOIN tabel_roti WHERE tabel_stok_sales.id_roti=tabel_roti.id_roti AND tabel_stok_sales.id_sales=tabel_sales.id_sales AND tabel_stok_sales.id_sales = '$nama_sales'");
    return $query->result();
  }

}
  
?>