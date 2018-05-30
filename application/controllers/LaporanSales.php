<?php
class LaporanSales extends CI_Controller{
	public function __construct(){
		parent::__construct();
		$this->load->library('session');
		$this->load->model('TransaksiSales_Model');
	}


	public function index(){
		$this->session->set_userdata('username', 'admin');
		//$this->load->view('StokSalesview');
		$data = array(
				'data'=>$this->TransaksiSales_Model->get_data());
		//$this->load->view('App/list_mhs',['data' => $data]);
		$this->load->view('laporanSalesGambarview',$data);
	}
	function cetak($id){
		$this->Transaksi_Model->cetak($id);
		redirect('RotiSIP-Web/LaporanSales');
	}

}
?>