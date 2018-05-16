<?php

class Penjualan_model extends CI_Model{

public function getAllPenjualan(){
		$this->db->select('*');
		$this->db->from('tabel_transaksi');

		return $this->db->get();
	}

	public function getPenjualan($id_roti){
		$this->db->where('id_roti', $id_roti);
		$this->db->select('*');
		$this->db->from('tabel_transaksi');

		return $this->db->get();
	}

	public function addPenjualan($tabel_transaksi){
		$this->db->insert('tabel_transaksi', $tabel_transaksi);
	}

	public function updatePenjualan($tabel_transaksi, $kondisi){
		$this->db->where($kondisi);
		$this->db->update('tabel_transaksi', $tabel_transaksi);
	}

	public function deletePenjualan($no_transaksi, $tgl_transaksi, $id_roti){
		$this->db->where('no_transaksi', $no_transaksi);
		$this->db->where('tgl_transaksi', $tgl_transaksi);
		$this->db->where('id_roti', $id_roti);
		$this->db->delete('tabel_transaksi');
	}
}
?>