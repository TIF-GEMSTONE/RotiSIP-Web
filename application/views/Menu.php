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