<?php
class LaporanSIP extends CI_Controller{
	public function __construct(){
		parent::__construct();
		$this->load->library('session');
		$this->load->model('Transaksi_Model');
	}


	public function index(){
		$this->session->set_userdata('username', 'admin');
		//$this->load->view('StokSalesview');
		$data = array(
				'data'=>$this->Transaksi_Model->get_data());
		//$this->load->view('App/list_mhs',['data' => $data]);
		$this->load->view('LaporanSalesView',$data);
	}

}
?>