<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Produk extends CI_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->model('M_produk');
    }

    public function input(){
      $this->load->view('input');
    }
    public function proses_input(){
      //membuat konfigurasi
      $config = [
        'upload_path' => './assets/images/',
        'allowed_types' => 'gif|jpg|png',
        'max_size' => 1000, 'max_width' => 1000,
        'max_height' => 1000
      ];
      $this->load->library('upload', $config);
      if (!$this->upload->do_upload()) //jika gagal upload
      {
          $error = array('error' => $this->upload->display_errors()); //tampilkan error
          $this->load->view('produk/input', $error);
      } else
      //jika berhasil upload
      {
          $file = $this->upload->data();
          //mengambil data di form
          $data = ['gambar' => $file['file_name'],
           'nama_roti' => set_value('nama_roti'),
           'harga' => set_value('harga')
         ];
          $this->M_produk->input($data); //memasukan data ke database
          redirect('produk/input'); //mengalihkan halaman

      }
  }

  public function data(){
  $data['produk'] = $this->M_produk->data();
  $this->load->view('Home_view', $data);
}

public function ubah($id){
    $data['produk'] = $this->M_produk->getid($id);
    $this->load->view('update', $data);
  }

  public function proses_ubah($id){
    $gambar = $this->M_produk->gambar($id);
    if(isset($_FILES["userfile"]["name"]))
      {
        //membuat konfigurasi
        $config = [
          'upload_path' => './assets/images/',
          'allowed_types' => 'gif|jpg|png',
          'max_size' => 1000, 'max_width' => 1000,
          'max_height' => 1000
        ];
        $this->load->library('upload', $config);
        if (!$this->upload->do_upload()) //jika gagal upload
        {
            $error = array('error' => $this->upload->display_errors()); //tampilkan error
            $this->load->view('update', $error);
        } else
        //jika berhasil upload
        {
            $file = $this->upload->data();
            //mengambil data di form
            $data = ['gambar' => $file['file_name']];
            unlink('assets/images/'.$gambar->gambar); //menghapus gambar yang lama
        }
      }
      $data['nama_roti']      = set_value('nama_roti');
      $data['harga']   = set_value('harga');
      $this->M_produk->ubah($id, $data); //memasukan data ke database
      redirect('produk/data'); //mengalihkan halaman
  }

  public function hapus($id){
  $gambar = $this->M_produk->gambar($id);
  unlink('assets/images/'.$gambar->gambar);
  $this->M_produk->hapus($id);
  redirect('produk/data'); //mengalihkan halaman
}

}
