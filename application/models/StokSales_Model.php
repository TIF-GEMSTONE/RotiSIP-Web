<?php 
class Model_Mahasiswa extends CI_Model {
	
	function get_table(){
        return $this->db->get("tabel_sales");
    }
    
	function get_data(){
		$query = $this->db->query("SELECT * FROM tabel_sales JOIN tabel_pusat JOIN tabel_roti WHERE tabel_sales.id_roti=tabel_pusat.id_roti AND tabel_pusat.id_roti=tabel_sales.id_roti");
		return $query->result();
	}
	}
      //$id_roti = $_GET['id_roti'];
     // $query=mysqli_query($con,"SELECT * FROM tabel_roti WHERE id_roti='$id_roti'");

      ?>