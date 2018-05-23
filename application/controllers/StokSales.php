<?php
class StokSales extends CI_Controller{
	public function __construct(){
		parent::__construct();
		$this->load->library('session');
		$this->load->model('StokSales_model');
	}


	public function index(){
		$this->session->set_userdata('username', 'admin');
		$data = array(
				'data'=>$this->StokSales_model->get_data());
		$this->load->view('StokSalesviewgambar',$data);
	}

	public function sales(){
		$data = array(
			'data'=>$this->StokSales_model->get_sales());
		$this->load->view('StokSalesview',$data);
	}

}
?>