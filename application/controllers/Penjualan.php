<?php
class Penjualan extends CI_Controller{
	public function __construct(){
		parent::__construct();
		$this->load->library('session');
		$this->load->helper(array('url'));
		$this->load->model('Penjualan_model');
	}

	function index(){
		if (isset($_POST['btnSubmit'])) {
			$this->model->insert();
				redirect('kasir');
		}else{
		$data = array(
				'data'=>$this->Penjualan_model->get_data());
		$this->load->view('ListPenjualan_view',$data);
		}
	}

	function input(){
<<<<<<< HEAD
		$x =$this->Penjualan_model->get_roti();
			$data = array(
				'roti'=>$this->Penjualan_model->get_roti()
				);
			$this->load->view('kasir', $data);
=======
		// $data = 
		$data = array(
			'no_transaksi' => $this->input->post('no_transaksi'),
			'id_roti' => $this->input->post('id_roti'),
			'jumlah_roti' => $this->input->post('jumlah_roti'),
			'harga' => $this->input->post('harga'),
			'tgl_transaksi' => $this->input->post('tgl_transaksi')
		);
			
			$this->load->view('kasir',$data);
>>>>>>> 5377489654d55e9233bbaee4aedc9f368ca5cd4d
		}

	function delete($no){
		$this->Penjualan_model->delete($no);
		redirect('Penjualan/home');

	}
	function edit(){
		$no = $this->uri->segment(3);
		$data = array(
            'user' => $this->Penjualan_model->get_data_edit($no),
		);
     	$data['no_transaksi']= $this->Penjualan_model->get_no_transaksi();
     	$data['id_roti']= $this->Penjualan_model->get_id_roti();
     	$data['jumlah_roti']= $this->Penjualan_model->get_jumlah_roti();
		$data['harga']= $this->Penjualan_model->get_harga();
		$data['tgl_transaksi']= $this->Penjualan_model->get_tgl_transaksi();

        $this->load->view("kasir", $data);
	
		
	}
	
	function update(){
		$no = $this->input->post('no_transaksi');
		$insert = $this->Penjualan_model->update(array(
                
				'id_roti' => $this->input->post('id_roti'),
				'jumlah_roti' => $this->input->post('jumlah_roti'),
				'harga' => $this->input->post('harga'),
				'tgl_transaksi' => $this->input->post('tgl_transaksi')
            ), $no);
        redirect('Penjualan/home');
        }

}
?>