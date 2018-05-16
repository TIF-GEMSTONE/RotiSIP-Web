<?php
class Penjualan extends CI_Controller{
	public function __construct(){
		parent::__construct();
		$this->load->library('session');
	}

	public function index(){
		$this->halaman = 'Data Transaksi';
		$halaman = $this->halaman;
		$this->load->helper('url');

		$data = $this->db->get('tabel_transaksi')->result_array();
		$jumlah = $this->db->get('tabel_transaksi')->num_rows();
		$main_view='Penjualan_view';
		$this->load->view('Penjualan_view', compact('halaman', 'main_view', 'data', 'jumlah'));
	}

	public function addPenjualanDB(){
		$data = array(
				'no_transaksi' => $this->input->post('no_transaksi'),
				'id_roti' => $this->input->post('id_roti'),
				'jumlah_roti' => $this->input->post('jumlah_roti'),
				'harga_jual' => $this->input->post('harga_jual'));
		$this->Penjualan_model->addPenjualan($data);
		redirect('dataTransaksi');
	}

	public function updatePenjualanDB(){
		$data = array(
				'id_roti' => $this->input->post('id_roti'),
				'jumlah_roti' => $this->input->post('jumlah_roti'),
				'harga_jual' => $this->input->post('harga_jual'));
		$condition['no_transaksi'] = $this->input->post('no_transaksi');
		$this->Penjualan_model->updatePenjualan($data, $condition);
		redirect('dataTransaksi');
	}

	public function deletePenjualanDB($no_transaksi, $tgl_transaksi, $id_roti){
		$this->Penjualan_model->deletePenjualan($no_transaksi, $tgl_transaksi, $id_roti);
		redirect('Penjualan');
	}

}
?>