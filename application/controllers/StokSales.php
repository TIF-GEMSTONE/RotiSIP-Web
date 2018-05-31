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
			$data = $this->StokSales_Model->input(array (
			'id_stok_sales' => $this->input->post('id_stok_sales'),
			'id_stok_pusat' => $this->input->post('id_stok_pusat'),
			'id_roti' => $this->input->post('nama_roti'),
			'id_sales' => $this->input->post('nama_sales'),
			'tgl_ambil' => $this->input->post('tgl_ambil'),
			'jumlah_stok_sales' => $this->input->post('jumlah_stok_sales')
			));
			redirect('StokSales');
		}else{
			$x =$this->StokSales_Model->get_roti();
			$data = array(
				'roti'=>$this->StokSales_Model->get_roti(),
				'sales'=>$this->StokSales_Model->get_sales()
				);
			$this->load->view('CreateStokSales_view', $data);
		}
	}
	

}
?>