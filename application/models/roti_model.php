<?php
class roti_model extends CI_Model{

	function get_data(){
    $query = $this->db->query("SELECT * FROM tabel_roti");
    return $query->result();
  }

  function update($data = array(),$id){
    $this->db->where('id_pesan',$id);
    return $this->db->update('tabel_pesanan',$data);
  }

	 function input($data = array()){
    return $this->db->insert('tabel_pesanan',$data);
  }

	function get_roti($id_roti){
		$hsl=$this->db->query("SELECT * FROM tabel_roti where id_roti='$id_roti'");
		return $hsl;
	}

	function get_id_roti(){
		$q = $this->db->query("SELECT MAX(RIGHT(id_roti,1)) AS kd_max FROM tabel_roti");
        $kd = "";
        if($q->num_rows()>0){
            foreach($q->result() as $k){
                $tmp = ((int)$k->kd_max)+1;
                $kd = sprintf("%06s", $tmp);
            }
        }else{
            $kd = "000001";
        }
        return "BR".$kd;
	}

}