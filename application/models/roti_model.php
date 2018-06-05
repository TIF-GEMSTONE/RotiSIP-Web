<?php
class roti_model extends CI_Model{

	function get_data(){
    $query = $this->db->query("SELECT * FROM tabel_coba");
    return $query->result();
  }

	 function input($data = array()){
    return $this->db->insert('tabel_detail_sip',$data);
  }

	function get_coba($id_coba){
		$query=$this->db->query("SELECT * FROM tabel_coba where id_coba='$id_coba'");
		return $query->result();
	}

	function get_id_coba(){
		$q = $this->db->query("SELECT MAX(RIGHT(id_coba,6)) AS kd_max FROM tabel_coba");
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