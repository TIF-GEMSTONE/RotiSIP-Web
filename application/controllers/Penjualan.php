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
			$tgl_transaksi = $_POST['tgl_transaksi'];
			$data = array(
				'data' =>$this->Penjualan_model->cari($tgl_transaksi));
			$this->load->view('ListPenjualan_view', $data);
		}else{
		$data = array(
				'data'=>$this->Penjualan_model->get_data());
		$this->load->view('ListPenjualan_view',$data);
	}
	}
	
	function input(){
		if (isset($_POST['btnTambah'])){
			$data = $this->Penjualan_model->input(array (
			'no_transaksi' => $this->input->post('no_transaksi'),
			'id_roti' => $this->input->post('id_roti'),
			'jumlah_roti' => $this->input->post('jumlah_roti'),
			'harga' => $this->input->post('harga'),
			'tgl_transaksi' => $this->input->post('tgl_transaksi')));
			redirect('Penjualan/home');
		}else{
			$x =$this->Penjualan_model->get_prodi();
			$data = array(
				'nama_prodi'=>$this->Model_Mahasiswa->get_prodi(),
				'gol'=>$this->Model_Mahasiswa->get_gol()
				);
			$this->load->view('App/input_mhs',$data);
		}
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
     	$data['no_transaksi']= $this->Penjualan_model->get_prodi();
     	$data['id_roti']= $this->Penjualan_model->get_prodi();
     	$data['jumlah_roti']= $this->Penjualan_model->get_gol();
		$data['harga']= $this->Penjualan_model->get_gol();
		$data['tgl_transaksi']= $this->Penjualan_model->get_gol();

        $this->load->view("EditPenjualan_view", $data);
	
		
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