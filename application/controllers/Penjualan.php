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

	function get_roti(){
		$id_roti=$this->input->post('id_roti');
		$x['roti']=$this->roti_model->get_roti($id_roti);
		$this->load->view('v_detail_jual',$x);
	}

	function add_to_cart(){
		$id_roti=$this->input->post('id_roti');
		$produk=$this->roti_model->get_roti($id_roti);
		$i=$produk->row_array();
		$data = array(
               'id_roti'       => $i['id_roti'],
               'nama_roti'     => $i['nama_roti'],
               'qty'      => $this->input->post('qty'),
               'amount'	  => str_replace(",", "", $this->input->post('harga'))
            );
	if(!empty($this->cart->total_items())){
		foreach ($this->cart->contents() as $items){
			$id_roti=$items['id_roti'];
			$qtylama=$items['qty'];
			$rowid=$items['rowid'];
			$id_roti=$this->input->post('id_roti');
			$qty=$this->input->post('qty');
			if($id==$id_roti){
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
				$notrans=$this->enjualan_model->get_notrans();
				$this->session->set_userdata('nofak',$nofak);
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