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

}
      //$id_roti = $_GET['id_roti'];
     // $query=mysqli_query($con,"SELECT * FROM tabel_roti WHERE id_roti='$id_roti'");
?>