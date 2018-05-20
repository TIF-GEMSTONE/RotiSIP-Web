<?php 
class StokSIP_Model extends CI_Model {
	
	function get_table(){
        return $this->db->get("tabel_stok_pusat");
    }
    
	function get_data(){
		$query = $this->db->query("SELECT * FROM tabel_stok_pusat");
		return $query->result();
	}
	}
      //$id_roti = $_GET['id_roti'];
     // $query=mysqli_query($con,"SELECT * FROM tabel_roti WHERE id_roti='$id_roti'");

      ?>