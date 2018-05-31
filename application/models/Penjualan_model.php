<?php
class Penjualan_model extends CI_Model {

	private $primary_key = 'id_roti';
	private $table_name	= 'tabel_roti';
	
	function get_table(){
        return $this->db->get("tabel_transaksi_sip");
    }
    
	function get_data(){
		$query = $this->db->query("SELECT * FROM tabel_transaksi_sip ");
		return $query->result();
	}
	
	function get_detail(){
		$query = $this->db->query("SELECT * FROM tabel_detail_sip");
		return $query->result();
	}
	
	function get_data_edit($no){
		$query = $this->db->query("SELECT * FROM tabel_transaksi_sip WHERE no_transaksi = '$no'");
		return $query->result_array();
	}

	function get_roti(){
    $query = $this->db->query("SELECT * FROM tabel_roti");
    return $query->result();
  }
	
	// function input($data = array()){
	// 	return $this->db->insert('tabel_detail_sip',$data);
	// }
	
	function delete($no){
		$this->db->where('no_transaksi', $no);
        return $this->db->delete('tabel_transaksi_sip');
	}
	
	function update($data = array(),$no){
		$this->db->where('no_transaksi',$no);
		return $this->db->update('tabel_transaksi_sip',$data);
	}

	public function get() 
	{
	  	
	  	$this->db->select('id_roti,nama_roti');

		return $this->db->get($this->table_name)->result();
	
	}

	public function get_by_id($id)
	{
	  
	  	$this->db->where($this->primary_key,$id); 
	  
	  	return $this->db->get($this->table_name)->row();
	
	}	

}

?>