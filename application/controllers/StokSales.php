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
	}
}

	// function input(){
	// 	if (isset($_POST['btnTambah'])){
	// 		$id=$this->input->post('id_stok_sales');
	// 		$data = $this->StokSales_Model->input(array (
	// 		'id_stok_sales' => $this->input->post('id_stok_sales'),
	// 		'id_roti' => $this->input->post('nama_roti'),
	// 		'id_sales' => $this->input->post('nama_sales'),
	// 		'tgl_ambil' => $this->input->post('tgl_ambil'),
	// 		'jumlah_stok_sales' => $this->input->post('jumlah_stok_sales')
	// 		));
	// 		$this->StokSales_Model->input($id,$data);
	// 		redirect('StokSales');
	// 	}else{
	// 		// $x =$this->StokSales_Model->get_roti();
	// 		$data = array(
	// 			'sales'=>$this->StokSales_Model->get_sales()
	// 			);
	// 		$this->load->view('CreateStokSales_view', $data);

	// 	}
	// }
	
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
			'data'=>$this->StokSales_Model->get_lihatubah($id))
		;
		$this->load->view('UbahStok_view',$data);
	}

	function ubah_stok(){
		$id=$this->input->post('id_stok_sales');
			$jumlahstok=$this->input->post('jumlah_stok');
			$jumlahtambah=$this->input->post('jumlah_stok_tambah');
			$stoktotal=$jumlahstok+$jumlahtambah;
		$data=['jumlah_stok_sales'=>$this->input->post('jumlah_stok_tambah')];
		$this->StokSales_Model->get_ubah($id,$data);
		redirect('StokSales');
	}

	function select_roti(){
            if('IS_AJAX') {
	        	$data['roti'] = $this->StokSales_Model->get_roti();	
				$this->load->view('pilihroti',$data);

            }
	}

	function select_stok(){
            if('IS_AJAX') {
	        	$data['stok'] = $this->StokSales_Model->get_stok();	
				$this->load->view('pilihstok',$data);

            }
	}

	
	
}
?>