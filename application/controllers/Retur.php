<?php
class Retur extends CI_Controller{
	function __construct(){
		parent::__construct();
		$this->load->helper(array('url'));
		$this->load->model('Retur_model');
	}
	
	public function index(){
		if (isset($_POST['btnSubmit'])) {
			$nama_sales = $_POST['nama_sales'];
			$data = array(
				'data' =>$this->Retur_model->cari($nama_sales));
			$this->load->view('Retur_view', $data);
		}else{
		$data = array(
				'data'=>$this->Retur_model->get_data());
		$this->load->view('Retur_view',$data);
	}
}
	
	function input(){
		if (isset($_POST['btnTambah'])){
			$data = $this->Retur_model->input(array (
			'id_retur' => $this->input->post('id_retur'),
			'id_sales' => $this->input->post('nama_sales'),
			'id_roti' => $this->input->post('nama_roti'),
			'jumlah_roti' => $this->input->post('jumlah_roti'),
			'tgl_kembali' => $this->input->post('tgl_kembali')));
			redirect('Retur');
		}else{
			$x =$this->Retur_model->get_roti();
			$data = array(
				'roti'=>$this->Retur_model->get_roti(),
				'sales'=>$this->Retur_model->get_sales()
				);
			$this->load->view('CreateRetur_view', $data);
		}
	function total (){
		$this->load->model('Retur_model');
		$model = $this->Retur_model;

		$model->set_jumlah_roti(7);
		$model->set_harga(10);

$this->load->view('Retur_view', array ('model'=>$model));
	}
	}
	
}
	
?>