<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="sip">
  <meta name="author" content="sip">
  <title>SIP</title>
  <!-- Bootstrap core CSS-->
  <link href="<?php echo base_url ('assets/vendor/bootstrap/css/bootstrap.min.css'); ?>" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="<?php echo base_url ('assets/vendor/font-awesome/css/font-awesome.min.css');?>" rel="stylesheet" type="text/css">
  <!-- Page level plugin CSS-->
  <link href="<?php echo base_url ('assets/vendor/datatables/dataTables.bootstrap4.css');?>" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="<?php echo base_url ('assets/css/sb-admin.css');?>" rel="stylesheet">
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
  <!-- Navigation-->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a class="navbar-brand" href="<?php echo base_url ();?>Login/Home">Roti SIP</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
          <a class="nav-link" href="<?php echo base_url();?>Penjualan">
            <i class="fa fa-fw fa-dashboard"></i>
            <span class="nav-link-text">Penjualan</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Form Sales">
          <a class="nav-link" href="<?php echo base_url();?>SalesBaru">
            <i class="fa fa-fw fa-area-chart"></i>
            <span class="nav-link-text">Sales</span>
          </a>
        </li>
       <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Link">
          <a class="nav-link" href="<?php echo base_url();?>Pesanan">
            <i class="fa fa-fw fa-link"></i>
            <span class="nav-link-text">Pesanan</span>
          </a>
        </li>
    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Link">
          <a class="nav-link" href="<?php echo base_url();?>Retur">
            <i class="fa fa-fw fa-link"></i>
            <span class="nav-link-text">Retur</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Example Pages">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseStok" data-parent="#exampleAccordion">
            <i class="fa fa-fw fa-area-chart"></i>
            <span class="nav-link-text">Stok</span>
          </a>
          <ul class="sidenav-second-level collapse" id="collapseStok">
            <li>
              <a href="<?php echo base_url();?>StokSales">Sales</a>
            </li>
            <li>
              <a href="<?php echo base_url();?>StokSIP">SIP</a>
            </li>
          </ul>
        </li>
         <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Menu Levels">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseLaporan" data-parent="#exampleAccordion">
            <i class="fa fa-fw fa-sitemap"></i>
            <span class="nav-link-text">Laporan</span>
          </a>
          <ul class="sidenav-second-level collapse" id="collapseLaporan">
            <li>
               <a href="<?php echo base_url();?>LaporanSales">Sales</a>
            </li>
            <li>
              <a href="<?php echo base_url();?>LaporanSIP">SIP</a>
            </li>
          </ul>
        </li>
      </ul>
      <ul class="navbar-nav sidenav-toggler">
        <li class="nav-item">
         <a class="nav-link text-center" id="sidenavToggler">
            <i class="fa fa-fw fa-angle-left"></i>
          </a>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle mr-lg-2" id="alertsDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
             <i class="fa fa-fw fa-envelope"></i>
            <span class="d-lg-none">Messages
              <span class="badge badge-pill badge-primary">12 New</span>
            </span>
            <span class="indicator text-primary d-none d-lg-block">
              <i class="fa fa-fw fa-circle"></i>
            </span>
          </a>
          <div class="dropdown-menu" aria-labelledby="messagesDropdown">
            <h6 class="dropdown-header">New Messages:</h6>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <strong>David Miller</strong>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">Hey there! This new version of SB Admin is pretty awesome! These messages clip off when they reach the end of the box so they don't overflow over to the sides!</div>
          </a>
          <div class="dropdown-menu" aria-labelledby="messagesDropdown">
          <div class="dropdown-menu" aria-labelledby="alertsDropdown">
            <div class="dropdown-divider"></div>
              <span class="text-danger">
            </a>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<?php echo base_url();?>Login/Logout">Logout</a>
        </li>
      </ul>
    </div>
  </nav>


  <div class="content-wrapper">
    <div class="container-fluid">
      <!-- Breadcrumbs-->
      
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="<?php echo base_url()?>StokSales">Stok</a>
        </li>
        <li class="breadcrumb-item active">Tables</li>
      </ol>
      <div class="card mb-3">
        <div class="card-header">
          <i class="fa fa-table"></i>Stok Sales</div>
        <div class="card-body">
          <div class="table-responsive">
            
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
               <thead>
                <tr>
                  <th>Nama Sales</th>
                  <th>Lihat Stok</th>
                </tr>
              </thead>
              <?php
                $no = 1;
                foreach ($data as $row): ?>
        <tr>
          <td><?php echo $row->nama_sales;?></td>
          <td> <a class="btn btn-primary" href="<?php echo site_url('StokSales/lihatstok/'.$row->id_sales)?>" name="btnStok">
                  View </a></td>
        </tr>
        <tr></tr>
                <?php $no++;
                endforeach;?>
      </table>
        
        
          <div class="table-responsive">
          </div>
        <div class="table-responsive">

            <center><hr class='divider'>
            <h2 class="card-title text-shadow text-black text-uppercase mb-0">
            </h2>
            <hr class='divider'></center>
            <p style='text-align:justify; margin:25px;'>

          </div>
        </div>

        </tr>

    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>

    
    <!-- Logout Modal-->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            <a class="btn btn-primary" href="login.html">Logout</a>
          </div>
        </div>
      </div>
    </div>
    <!-- Bootstrap core JavaScript-->
    <script src="<?php echo base_url ('assets/vendor/jquery/jquery.min.js') ?>"></script>
    <script src="<?php echo base_url ('assets/vendor/bootstrap/js/bootstrap.bundle.min.js')?>"></script>
    <!-- Core plugin JavaScript-->
    <script src="<?php echo base_url ('assets/vendor/jquery-easing/jquery.easing.min.js')?>"></script>
    <!-- Page level plugin JavaScript-->
    <script src="<?php echo base_url ('asstes/vendor/chart.js/Chart.min.js')?>"></script>
    <script src="<?php echo base_url ('asstes/vendor/datatables/jquery.dataTables.js')?>"></script>
    <script src="<?php echo base_url ('asstes/vendor/datatables/dataTables.bootstrap4.js')?>"></script>
    <!-- Custom scripts for all pages-->
    <script src="<?php echo base_url ('asstes/js/sb-admin.min.js')?>"></script>
    <!-- Custom scripts for this page-->
    <script src="<?php echo base_url ('asstes/js/sb-admin-datatables.min.js')?>"></script>
    <script src="<?php echo base_url ('asstes/vendor/chart.js/Chart.min.js')?>"></script>
  </div>
</body>

</html>
