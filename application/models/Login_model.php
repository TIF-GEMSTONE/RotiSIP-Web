<?php
class Login_model extends CI_Model{
	public $user;
	public $password;

	public $labels = [];

	public function __construct(){
		parent::__construct();
		$this->labels = $this->_attributeLabels();
		$this->load->database();
	}

	public function cek_log(){
		$sql = sprintf("SELECT COUNT(*) AS hitung FROM user WHERE user='%s' AND password='%s'",
			$this->user,
			$this->password);
		$query = $this->db->query($sql);
		$row = $query->row_array();
		return $row['hitung'] == 1;
	}

	private function _attributeLabels(){
		return [
			'user'=>'User :',
			'password'=>'Password :'];
	}
}
?>