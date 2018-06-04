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
		$data['tabel_roti'] = $this->Penjualan_model->get();
			$this->load->view('kasir',$data);
			}

	function delete($no){
		$this->Penjualan_model->delete($no);
		redirect('Penjualan/home');

	}

public function getroti($id)
	{

		$this->load->model('Penjualan_model');

		$tabel_roti = $this->Penjualan_model->get_by_id($id);

		if ($tabel_roti) {
			if ($tabel_roti->harga == '0') {
				$disabled = 'disabled';
				$info_stok = '<span class="help-block badge" id="reset" 
					          style="background-color: #d9534f;">
					          stok habis</span>';
			}else{
				$disabled = '';
				$info_stok = '<span class="help-block badge" id="reset" 
					          style="background-color: #5cb85c;">stok : '
					          .$tabel_roti->harga.'</span>';
			}

			echo '<div class="form-group">
				      <label class="control-label col-md-3" 
				      	for="nama_roti">Nama Roti :</label>
				      <div class="col-md-8">
				        <input type="text" class="form-control reset" 
				        	name="nama_roti" id="nama_roti" 
				        	value="'.$tabel_roti->nama_roti.'"
				        	readonly="readonly">
				      </div>
				    </div>
				    <div class="form-group">
				      <label class="control-label col-md-3" 
				      	for="harga">Harga (Rp) :</label>
				      <div class="col-md-8">
				        <input type="text" class="form-control reset" id="harga" name="harga" 
				        	value="'.number_format( $tabel_roti->harga, 0 ,
				        	 '' , '.' ).'" readonly="readonly">
				      </div>
				    </div>
				    ';
	    }else{

	    	echo '<div class="form-group">
				      <label class="control-label col-md-3" 
				      	for="nama_roti">Nama Roti :</label>
				      <div class="col-md-8">
				        <input type="text" class="form-control reset" 
				        	name="nama_roti" id="nama_roti" 
				        	readonly="readonly">
				      </div>
				    </div>
				    <div class="form-group">
				      <label class="control-label col-md-3" 
				      	for="harga">Harga (Rp) :</label>
				      <div class="col-md-8">
				        <input type="text" class="form-control reset" 
				        	name="harga" id="harga" 
				        	readonly="readonly">
				      </div>
				    </div>
				    <div class="form-group">
				      <label class="control-label col-md-3" 
				      	for="qty">Quantity :</label>
				      <div class="col-md-4">
				        <input type="number" class="form-control reset" 
				        	autocomplete="off" onchange="subTotal(this.value)" 
				        	onkeyup="subTotal(this.value)" id="jumlah_roti" min="0"  
				        	name="qty" placeholder="Isi qty...">
				      </div>
				    </div>';
	    }

	}

	public function ajax_list_transaksi()
	{

		$data = array();

		$no = 1; 
        
        foreach ($this->cart->contents() as $items){
        	
			$row = array();
			$row[] = $no;
			$row[] = $items["id_roti"];
			$row[] = $items["name"];
			$row[] = 'Rp. ' . number_format( $items['price'], 
                    0 , '' , '.' ) . ',-';
			$row[] = $items["jumlah_roti"];
			$row[] = 'Rp. ' . number_format( $items['subtotal'], 
					0 , '' , '.' ) . ',-';

			//add html for action
			$row[] = '<a 
				href="javascript:void()" style="color:rgb(255,128,128);
				text-decoration:none" onclick="deleteroti('
					."'".$items["rowid"]."'".','."'".$items['subtotal'].
					"'".')"> <i class="fa fa-close"></i> Delete</a>';
		
			$data[] = $row;
			$no++;
        }

		$output = array(
						"data" => $data,
				);
		//output to json format
		echo json_encode($output);
	}

	public function addroti()
	{

		$data = array(
				'id_roti' => $this->input->post('id_roti'),
				'nama_roti' => $this->input->post('nama_roti'),
				'harga' => str_replace('.', '', $this->input->post(
					'harga')),
				'jumlah_roti' => $this->input->post('jumlah_roti')
			);
		$insert = $this->cart->insert($data);
		echo json_encode(array("status" => TRUE));
	}

	public function deleteroti($rowid) 
	{

		$this->cart->update(array(
				'rowid'=>$rowid,
				'jumlah_roti'=>0,));
		echo json_encode(array("status" => TRUE));
	}
}
?>