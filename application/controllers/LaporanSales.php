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
				'data'=>$this->TransaksiSales_Model->get_laporan());
		$this->load->view('laporanSalesview',$data);
	}
	
 function detail($id){
    	$data = array (
				'detail' =>$this->TransaksiSales_Model->get_detail($id));
		$this->load->view('DetailTransaksiSales_view', $data);
    }
}
?>