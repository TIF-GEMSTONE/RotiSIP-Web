<?php
class StokSIP extends CI_Controller{
	public function __construct(){
		parent::__construct();
		$this->load->library('session');
		$this->load->model('StokSIP_model');
	}


	public function index(){
		$this->session->set_userdata('username', 'admin');
		$data = array(
				'data'=>$this->StokSIP_model->get_data());
		$this->load->view('StokSIP_view',$data);
	}

}
?>