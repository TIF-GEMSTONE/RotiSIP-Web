<?php 
class StokSales_Model extends CI_Model {
	
	function get_table(){
        return $this->db->get("tabel_stok_sales");
    }
    
	function get_data(){
		$query = $this->db->query("SELECT * FROM tabel_sales ");
		return $query->result();
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

}
  
?>