<?php
class LaporanSales extends CI_Controller{
	public function __construct(){
		parent::__construct();
		$this->load->library('session');
		$this->load->model('StokSales_model');
	}


	public function index(){
		$this->session->set_userdata('username', 'admin');
		//$this->load->view('StokSalesview');
		$data = array(
				'data'=>$this->StokSales_model->get_data());
		//$this->load->view('App/list_mhs',['data' => $data]);
		$this->load->view('StokSalesview',$data);
	}

}
?>