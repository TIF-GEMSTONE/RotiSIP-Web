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

<<<<<<< HEAD

}
=======
	public function sales(){
		$data = array(
			'data'=>$this->StokSales_model->get_sales());
		$this->load->view('StokSalesview',$data);
	}

	public function input(){
		if (isset($_POST['btnTambah'])){
			$data = $this->Pesanan_model->input(array (
			'id_stok_sales' => $this->input->post('id_stok_sales'),
			'id_stok_pusat' => $this->input->post('id_stok_pusat'),
			'id_roti' => $this->input->post('id_roti'),
			'id_sales' => $this->input->post('id_sales'),
			'tgl_ambil' => $this->input->post('tgl_ambil'),
			'jumlah_stok_sales' => $this->input->post('jumlah_stok_sales')
			));
			redirect('StokSales');
		}else{
			$x =$this->Pesanan_model->get_roti();
			$data = array(
				'roti'=>$this->Pesanan_model->get_roti()
				);
			$this->load->view('CreatePesanan_view', $data);
		}
	}
	}

>>>>>>> 441f40dfe69dbbc0d6fa84381ef7460f6fb3a506
?>