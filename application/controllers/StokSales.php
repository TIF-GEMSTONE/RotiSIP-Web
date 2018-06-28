<?php
class StokSales extends CI_Controller{

	public function __construct(){
		parent::__construct();
		$this->load->library('session');
		$this->load->model('StokSales_Model');
	}

	public function index(){
		if (isset($_POST['btnSubmit'])) {
			$nama_sales = $_POST['nama_sales'];
			$data = array(
				'data' =>$this->StokSales_Model->cari($nama_sales));
				$this->load->view('StokSalesview', $data);
		}else{
		$data = array(
				'data'=>$this->StokSales_Model->get_data());
		$this->load->view('StokSalesview',$data);
	}}
	
	function lihatstok(){
		$id= $this->uri->segment(3);
		$data=array(
			'data'=>$this->StokSales_Model->get_lihatstok($id))
		;
		$this->load->view('LihatStok_view',$data);
	}

	function btnStok(){
		$id= $this->uri->segment(3);
		$data=array(
			'data'=>$this->StokSales_Model->get_lihatubah($id))	;
		$this->load->view('UbahStok_view',$data);
	}

	function ubah_stok(){
		// $id= $this->uri->segment(3);
		// $jumlahstok=$this->input->post('jumlah_stok');
		// $jumlahtambah=$this->input->post('jumlah_stok_tambah');
		// $stoktotal=$jumlahstok+$jumlahtambah;
		// $data=['jumlah_stok_sales'=>$stoktotal[]];
		// $this->StokSales_Model->get_ubah($id,$data);
		// redirect('StokSales');

		$id= $this->uri->segment(3);
		$data=['jumlah_stok_sales'=>$this->input->post('jumlah_stok')+$this->input->post('jumlah_stok_tambah')];
		$this->StokSales_Model->get_ubah($id,$data);
		redirect('StokSales');
	}

	
}
?>