<?php
class Penjualan extends CI_Controller{
	public function __construct(){
		parent::__construct();
		$this->load->library('session');
	}

	public function index(){
		$this->session->set_userdata('username', 'admin');
		$this->load->view('Penjualan_view');
	}

}
?>