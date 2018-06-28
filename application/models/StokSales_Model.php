<?php 
class StokSales_Model extends CI_Model {
	
	function get_table(){
        return $this->db->get("tabel_stok_sales");
    }
    
	function get_data(){
		$query = $this->db->query("SELECT * FROM tabel_sales ");
		return $query->result();
	}
	

   function input($id){
    try{
       $this->db->where('id_sales',$id)->limit(1)->update('tabel_stok_sales',$data);
        return true;
    }catch(Exception $error){}

  }


  function get_sales(){
    $result = array();
    $this->db->select('*');
    $this->db->from('tabel_sales');
    $this->db->order_by('nama_sales','ASC');
    $array_keys_values = $this->db->get();
        foreach ($array_keys_values->result() as $row)
        {
            $result[0]= '-Pilih Sales-';
            $result[$row->id_sales]= $row->nama_sales;
        }
        
        return $result;
  }

  function get_lihatstok($id_sales){
    $query = $this->db->query("SELECT * FROM tabel_stok_sales 
            JOIN tabel_roti on tabel_roti.id_roti = tabel_stok_sales.id_roti
            JOIN tabel_sales on tabel_sales.id_sales = tabel_stok_sales.id_sales
            where tabel_stok_sales.id_sales='$id_sales' ");
        return $query->result();
  }

  function get_lihatubah($id){
    $query = $this->db->query("SELECT * FROM tabel_stok_sales 
            JOIN tabel_roti on tabel_roti.id_roti = tabel_stok_sales.id_roti
            JOIN tabel_sales on tabel_sales.id_sales = tabel_stok_sales.id_sales
            where tabel_stok_sales.id_stok_sales='$id' ");
        return $query->result();
  }  

  function get_ubah($id,$data){
     try{
       $this->db->where('id_stok_sales',$id)->limit(1)->update('tabel_stok_sales',$data);
        return true;
    }catch(Exception $error){}

  }

  // function get_roti(){
  //   $id_sales = $this->input->post('id_sales');
    
  //   $result = array();
  //   $this->db->select('*');
  //   $this->db->from('tabel_stok_sales','tabel_roti');
  //   $this->db->join('tabel_roti', 'tabel_stok_sales.id_roti = tabel_roti.id_roti');
  //   $this->db->where('tabel_stok_sales.id_sales',$id_sales);
  //   $this->db->order_by('tabel_stok_sales.id_roti','ASC');

  //   $array_keys_values = $this->db->get();
  //       foreach ($array_keys_values->result() as $row)
  //       {
  //           $result[0]= '-Pilih Roti-';
  //           $result[$row->id_roti]= $row->nama_roti;
  //       }
        
  //       return $result;
  // }

  // function get_stok(){
  //   $id_roti= $this->input->post('id_roti');
  //   $id_sales = $this->input->post('id_sales');
  //   $result = array();
  //   $this->db->select('*');
  //   $this->db->from('tabel_stok_sales');
  //   $where = array('id_roti'=>$id_roti, 'id_sales'=>$id_sales);
  //   $this->db->where($where);
  //   $this->db->order_by('id_roti','ASC');

  //   $array_keys_values = $this->db->get();
  //       foreach ($array_keys_values->result() as $row)
  //       {
  //           $result[0]= '-Stok Roti-';
  //           $result[$row->id_stok_sales]= $row->id_stok_sales;
  //       }
        
  //       return $result;
  // }
}
  
?>