<?php

include 'koneksi.php';
	
	$id_sales=$_POST['id_sales'];
	$sql = "SELECT nama_roti, gambar, harga, tabel_stok_sales.id_roti, tabel_stok_sales.id_stok_sales FROM tabel_roti, tabel_stok_sales , tabel_sales WHERE tabel_roti.id_roti=tabel_stok_sales.id_roti AND tabel_sales.id_sales=tabel_stok_sales.id_sales AND tabel_stok_sales.id_sales='$id_sales'";

	$r = mysqli_query($con,$sql);
	
	$result = array();
	
	while($row = mysqli_fetch_array($r)){
		 
		array_push($result,array(
			"nama_roti"=>$row['nama_roti'],
			"gambar"=>$row['gambar'],
			"harga"=>$row['harga'],
			"id_roti"=>$row['id_roti'],
			"id_stok_sales"=>$row['id_stok_sales']
		));
	}
	
	//Menampilkan Array dalam Format JSON
	echo json_encode(array('result'=>$result));
	
	mysqli_close($con);

?>

