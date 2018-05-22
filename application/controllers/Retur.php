<?php
class Retur extends CI_Controller{
	function __construct(){
		parent::__construct();
		$this->load->helper(array('url'));
		$this->load->model('Retur_model');
	}
	
	function index(){
		$data = array (
				'data' =>$this->Retur_model->get_data());
		$this->load->view('Retur_view', $data);
	}
	
	function input(){
		if (isset($_POST['btnTambah'])){
			$data = $this->Retur_model->input(array (
			'nama_roti' => $this->input->post('nama_roti'),
			'jumlah_roti' => $this->input->post('jumlah_roti'),
			'tgl_kembali' => $this->input->post('tgl_kembali'),
			'jam_ambil' => $this->input->post('jam_ambil')));
			redirect('Retur');
		}else{
			$this->load->view('Retur_view');
		}
	}
	function delete($id){
		$this->Retur_model->delete($id);
		redirect('Retur');
	}
	}
	
?>
