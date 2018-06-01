<?php 
class TransaksiSIP_Model extends CI_Model {
	
	function get_table(){
        return $this->db->get("tabel_detail_sip");
    }
    
	function get_data(){
		$query = $this->db->query("SELECT * FROM tabel_detail_sip");
		return $query->result();
	}
	
	function get_laporan(){
		$this->db->select('tabel_transaksi_sip.*, tabel_pegawai.nama_pegawai');
		$this->db->from('tabel_transaksi_sip');
		$this->db->join('tabel_pegawai', 'tabel_pegawai.id_pegawai = tabel_transaksi_sip.id_pegawai');
		$query = $this->db->get();
		return $result = $query->result_array();
	}

	}
      //$id_roti = $_GET['id_roti'];
     // $query=mysqli_query($con,"SELECT * FROM tabel_roti WHERE id_roti='$id_roti'");

      ?>