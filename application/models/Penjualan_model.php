<?php
class Penjualan_model extends CI_Model {
	
	function get_table(){
        return $this->db->get("tabel_transaksi");
    }
    
	function get_data(){
		$query = $this->db->query("SELECT * FROM tabel_transaksi ");
		return $query->result();
	}
	
	function get_detail(){
		$query = $this->db->query("SELECT * FROM tabel_detail_transaksi");
		return $query->result();
	}
	
	function get_data_edit($no){
		$query = $this->db->query("SELECT * FROM tabel_transaksi WHERE no_transaksi = '$no'");
		return $query->result_array();
	}
	
	function input($data = array()){
		return $this->db->insert('tabel_transaksi',$data);
	}
	
	function delete($no){
		$this->db->where('no_transaksi', $no);
        return $this->db->delete('tabel_transaksi');
	}
	
	function update($data = array(),$no){
		$this->db->where('no_transaksi',$no);
		return $this->db->update('tabel_transaksi',$data);
	}

	function cari($tgl){
		$query = $this->db->query("SELECT * FROM tm_mahasiswa JOIN tm_prodi JOIN tm_gol WHERE tm_mahasiswa.tm_prodi_id=tm_prodi.id AND tm_mahasiswa.tm_gol_id=tm_gol.id AND tm_mahasiswa.nama = '$tgl'");
		return $query->result();
	}
}