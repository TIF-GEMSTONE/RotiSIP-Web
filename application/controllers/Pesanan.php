<?php
class Pesanan extends CI_Controller{
	function __construct(){
		parent::__construct();
		$this->load->helper(array('url'));
		$this->load->model('Pesanan_model');
	}
	
	function index(){
		$data = array (
				'data' =>$this->Pesanan_model->get_data());
		$this->load->view('ReadPesanan_view', $data);
	}
	
	function input(){
		if (isset($_POST['btnTambah'])){
			$data = $this->Pesanan_model->input(array (
			'id_pesan' => $this->input->post('id_pesan'),
			'id_roti' => $this->input->post('id_roti'),
			'id_sales' => $this->input->post('id_sales'),
			'nama_pemesan' => $this->input->post('nama_pemesan'),
			'no_telp' => $this->input->post('no_telp'),
			'tgl_pesan' => $this->input->post('tgl_pesan'),
			'tgl_ambil' => $this->input->post('tgl_ambil'),
			'jam_ambil' => $this->input->post('jam_ambil'),
			'jumlah_roti' => $this->input->post('jumlah_roti')));
			redirect('Pesanan');
		}else{
			$x =$this->Pesanan_model->get_roti();
			$data = array(
				'roti'=>$this->Pesanan_model->get_roti(),
				'sales'=>$this->Pesanan_model->get_sales()
				);
			$this->load->view('CreatePesanan_view',$data);
		}
	}
	function delete($id){
		$this->Pesanan_model->delete($id);
		redirect('Pesanan');
	}
	function edit(){
		$id = $this->uri->segment(3);
		$data = array(
            'user' => $this->Pesanan_model->get_data_edit($id),
		);
     	$data['id']= $this->Pesanan_model->get_prodi();
     	$data['prodi']= $this->Pesanan_model->get_prodi();
		$data['id']= $this->Pesanan_model->get_gol();
		$data['golongan']= $this->Pesanan_model->get_gol();

        $this->load->view("UpdatePesanan_view", $data);
	
		
	}
	
	function update(){
		$id = $this->input->post('id_pesan');
		$insert = $this->Pesanan_model->update(array(
			'id_roti' => $this->input->post('nama_roti'),
			'id_sales' => $this->input->post('nama_sales'),
			'nama_pemesan' => $this->input->post('nama_pemesan'),
			'no_telp' => $this->input->post('no_telp'),
			'tgl_pesan' => $this->input->post('tgl_pesan'),
			'tgl_ambil' => $this->input->post('tgl_ambil'),
			'jam_ambil' => $this->input->post('jam_ambil'),
			'jumlah_roti' => $this->input->post('jumlah_roti')
            ), $id);
        redirect('Pesanan');
        }
	
}
?>
