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

}
	function sales(){
		$data = array(
			'data'=>$this->StokSales_model->get_sales());
		$this->load->view('StokSalesview',$data);
	}

	function input(){
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

		function edit() {
        $id = $this->uri->segment(3);
        $e = $this->db->where('id_profile', $id)->get('profile')->row();

        $kirim['id'] = $e->id_profile;
        $kirim['nama'] = $e->nama;
        $kirim['alamat'] = $e->alamat;

        $this->output
                ->set_content_type('application/json')
                ->set_output(json_encode($kirim));
    }
	}
	


?>