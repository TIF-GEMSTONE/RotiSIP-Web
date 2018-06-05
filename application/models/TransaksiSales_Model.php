<?php 
class TransaksiSales_Model extends CI_Model {
	
	function get_table(){
        return $this->db->get("tabel_detail_sales");
    }
    
	function get_data(){
		$query = $this->db->query("SELECT * FROM tabel_detail_sales");
		return $query->result();
	}
	function get_laporan(){
		$this->db->select('tabel_transaksi_sales.*, tabel_sales.nama_sales');
		$this->db->from('tabel_transaksi_sales');
		$this->db->join('tabel_sales', 'tabel_sales.id_sales = tabel_transaksi_sales.id_sales');
		$query = $this->db->get();
		return $result = $query->result_array();
	}
	
	function get_detail($id){
    $query = $this->db->query("SELECT * FROM tabel_detail_sales JOIN tabel_roti JOIN tabel_transaksi_sales WHERE tabel_detail_sales.id_roti=tabel_roti.id_roti AND tabel_detail_sales.no_transaksi=tabel_transaksi_sales.no_transaksi AND tabel_detail_sales.no_transaksi = $id");
    return $query->result();
  }
	}
     

      ?>