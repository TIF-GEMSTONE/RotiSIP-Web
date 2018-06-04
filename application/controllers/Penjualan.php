<?php
class Penjualan extends CI_Controller{
	public function __construct(){
		parent::__construct();
		$this->load->helper(array('url'));
		$this->load->model('roti_model');
		$this->load->model('Penjualan_model');
	}

	function index(){
		$data = array (
				'data' =>$this->roti_model->get_data());
		$this->load->view('v_penjualan', $data);
	}

	function get_coba(){
		$id_coba=$this->input->post('id_coba');
		$x['roti']=$this->roti_model->get_roti($id_coba);
		$this->load->view('v_detail_jual',$x);
	}

	function add_to_cart(){
		$id_coba=$this->input->post('id_coba');
		$produk=$this->roti_model->get_coba($id_coba);
		$i=$produk->row_array();
		$data = array(
               'id_coba'       => $i['id_coba'],
               'nama_coba'     => $i['nama_coba'],
               'stok'	     => $i['stok'],
               'qty'      	=> $this->input->post('qty'),
               'amount'	  	=> str_replace(",", "", $this->input->post('harga'))
            );
	if(!empty($this->cart->total_items())){
		foreach ($this->cart->contents() as $items){
			$id_coba=$items['id_coba'];
			$qtylama=$items['qty'];
			$rowid=$items['rowid'];
			$id_coba=$this->input->post('id_coba');
			$qty=$this->input->post('qty');
			if($id==$id_coba){
				$up=array(
					'rowid'=> $rowid,
					'qty'=>$qtylama+$qty
					);
				$this->cart->update($up);
			}else{
				$this->cart->insert($data);
			}
		}
	}else{
		$this->cart->insert($data);
	}

		redirect('Penjualan');
	}

	function remove(){
		$row_id=$this->uri->segment(4);
		$this->cart->update(array(
               'rowid'      => $row_id,
               'qty'     => 0
            ));
		redirect('Penjualan');
	
	}

	function simpan_penjualan(){
		$total=$this->input->post('total');
		$jml_uang=str_replace(",", "", $this->input->post('jml_uang'));
		$kembalian=$jml_uang-$total;
		if(!empty($total) && !empty($jml_uang)){
			if($jml_uang < $total){
				echo $this->session->set_flashdata('msg','<label class="label label-danger">Jumlah Uang yang anda masukan Kurang</label>');
				redirect('Penjualan');
			}else{
				$notrans=$this->Penjualan_model->get_notrans();
				$this->session->set_userdata('notrans',$notrans);
				$order_proses=$this->Penjualan_model->simpan_penjualan($notrans,$total_jual,$uang,$kembalian);
				if($order_proses){
					$this->cart->destroy();
					
					$this->session->unset_userdata('tgl_transaksi');
					$this->load->view('laporanSIPview');	
				}else{
					redirect('Penjualan');
				}
			}
			
		}else{
			echo $this->session->set_flashdata('msg','<label class="label label-danger">Penjualan Gagal di Simpan, Mohon Periksa Kembali Semua Inputan Anda!</label>');
			redirect('Penjualan');
		}

	}
}
?>