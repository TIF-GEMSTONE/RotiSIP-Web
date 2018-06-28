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

	function input(){
		if (isset($_POST['btnTambah'])){
			$id=$this->input->post('id_stok_sales');
			$data = $this->StokSales_Model->input(array (
			'id_stok_sales' => $this->input->post('id_stok_sales'),
			'id_roti' => $this->input->post('nama_roti'),
			'id_sales' => $this->input->post('nama_sales'),
			'tgl_ambil' => $this->input->post('tgl_ambil'),
			'jumlah_stok_sales' => $this->input->post('jumlah_stok_sales')
			));
			$this->StokSales_Model->input($id,$data);
			redirect('StokSales');
		}else{
			// $x =$this->StokSales_Model->get_roti();
			$data = array(
				'sales'=>$this->StokSales_Model->get_sales()
				);
			$this->load->view('CreateStokSales_view', $data);

		}
	}
	
	function lihatstok(){
		//$id=$this->input->post('id_sales');
		$id= $this->uri->segment(3);
		//$id=$this->input->post('id_sales');
		$data=array(
			'data'=>$this->StokSales_Model->get_lihatstok($id))
		;
		$this->load->view('LihatStok_view',$data);
		echo "berhasil";
	}

	function btnStok(){
		if(isset($_POST['btnStok'])){
			$id=$this->input->post('id_stok_sales');
			$data = array(
				'data'=>$this->StokSales_Model->get_lihatstok());
		$this->load->view('LihatStok_view',$data);
		}
	}

	function lihat_stok(){
		$data['data'] = $this->StokSales_Model->get_lihatstok($id);
		$this->load->view('LihatStok_view',$data);
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

	
	// function select_stok(){
	// 	if('IS_AJAX') {
	//         	$data['stok'] = $this->StokSales_Model->get_stok();
	// 			$this->load->view('pilihstok',$data);
	// 	})
	// }
	
}
?>