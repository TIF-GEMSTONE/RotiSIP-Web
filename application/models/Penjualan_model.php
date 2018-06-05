<?php
class Penjualan_model extends CI_Model {

	function simpan_penjualan($notrans,$total_jual,$uang,$kembalian){
		$this->db->query("INSERT INTO tabel_transaksi_sip (no_transaksi,total_jual,uang,kembalian) VALUES ('$notrans',
			'$uang','$kembalian')");
		foreach ($this->cart->contents() as $item) {
			$data=array(
				'no_transaksi' 		=>	$notrans,
				'id_roti'			=>	$item['id_roti'],
				'harga'				=>	$item['amount'],
				'jumlah'			=>	$item['qty'],
				'total'				=>	$item['subtotal']
			);
			$this->db->insert('tabel_detail_sip',$data);
			$this->db->query("update tabel_stok_pusat set jumlah_stok_pusat=jumlah_stok_pusat-'$item[qty]' where id_stok_pusat='$item[id_stok_pusat]'");
		}
		return true;
	}
	function get_notrans(){
		$q = $this->db->query("SELECT MAX(RIGHT(no_transaksi,1)) AS kd_max FROM tabel_transaksi_sip WHERE DATE(tgl_transaksi)=CURDATE()");
        $kd = "";
        if($q->num_rows()>0){
            foreach($q->result() as $k){
                $tmp = ((int)$k->kd_max)+1;
                $kd = sprintf("%06s", $tmp);
            }
        }else{
            $kd = "000001";
        }
        return date('dmy').$kd;
	}
}


?>