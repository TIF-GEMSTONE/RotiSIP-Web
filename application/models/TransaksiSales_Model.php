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
		$this->db->select('tabel_detail_sales.*, tabel_roti.nama_roti, tabel_roti.harga');
		$this->db->from('tabel_detail_sales');
		$this->db->join('tabel_roti', 'tabel_roti.id_roti = tabel_detail_sales.id_roti');
		$this->db->join('tabel_transaksi_sales', 'tabel_transaksi_sales.no_transaksi = tabel_detail_sales.no_transaksi');
		$this->db->where(array('tabel_detail_sales.no_transaksi' => $id));
		$query = $this->db->get();
		return $result = $query->result_array();
	}

	}
     

      ?>