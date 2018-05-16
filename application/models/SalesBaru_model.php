<?php
	class SalesBaru_model extends CI_Model{
		public $id_sales;
		public $nama_sales;
		public $alamat;
		public $no_telp;
		public $username;
		public $password;
		public $labels = [];

		public function __construct(){
			parent::__construct();
			$this->labels = $this->_attributeLabels();
			$this->load->database();
		}

		public function insert(){
			$sql = sprintf("INSERT INTO tabel_sales VALUES ('%s', '%s', '%s', '%s', '%s', '%s')",
				$this->id_sales,
				$this->nama_sales,
				$this->alamat,
				$this->no_telp,
				$this->username,
				$this->password);
			$this->db->query($sql);
		}

		public function update(){
			$sql = sprintf("UPDATE tabel_sales SET nama_sales='%s', alamat='%s', no_telp='%s' WHERE id_sales='%s'",
				$this->nama_sales,
				$this->alamat,
				$this->no_telp,
				$this->id_sales);
			$this->db->query($sql);	
		}

		public function delete(){
			$sql = sprintf("DELETE FROM tabel_sales WHERE id_sales = '%s'", $this->id_sales);
			$this->db->query($sql);
		}

		public function read(){
			$sql = "SELECT * FROM tabel_sales ORDER BY id_sales";
			$query = $this->db->query($sql);
			return $query->result();
		}

		private function _attributeLabels(){
			return [
				'id_sales'=>'Id_sales:',
				'nama_sales'=>'Nama_sales:',
				'alamat'=>'Alamat:',
				'no_telp'=>'No_telp:',
				'username'=>'Username:',
				'password'=>'Password:'];
		}
	}
?>