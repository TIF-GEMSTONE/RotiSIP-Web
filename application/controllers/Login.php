<?php
class Login extends CI_Controller{
	public $model = NULL;

	public function __construct(){
		parent::__construct();
		$this->load->model('Login_model');
		$this->model = $this->Login_model;

		$this->load->library('session');
		$this->load->helper('url');
	}

	public function index (){
		if (isset($_POST['btn_log'])) {
			$this->model->username = $_POST['txt_user'];
			$this->model->password = $_POST['txt_pass'];
			if ($this->model->cek_log()==TRUE) {
				$this->session->set_userdata('username', $this->model->username);
				$this->load->view('Home_view', ['model'=>$this->model]);
			}else{
				redirect('Login');
			}
		}else{
			$this->load->view('Login_view', ['model'=>$this->model]);
		}
	}
	function Home(){
		$this->load->view('Home_view');
	}

	public function Logout(){
		if ($this->session->has_userdata('username')) {
			$this->session->sess_destroy();
		redirect('Login');
		}
	}
}
?>