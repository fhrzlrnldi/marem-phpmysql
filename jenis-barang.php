<?php

require_once 'db.php';

class jenisbarang extends db
{
    public function show()
    {
        $data = $this->db->prepare("SELECT * FROM viewjenisbrg");
        try
        {
            $data->execute();
            $result = $data->fetchAll();
        }
        catch(PDOException $e)
        {
            print_r($e->getMessage());
        }
        return $result;
    }


    public function store($id_jenis, $nama_jenis)
    {
        $data = $this->db->prepare("INSERT INTO jenis_barang (id_jenis, nama_jenis) VALUES (?, ?)");
        $data->bindParam(1, $id_jenis);
        $data->bindParam(2, $nama_jenis);
        try
        {
            $result = $data->execute();
        }
        catch(PDOExveption $e)
        {
            print_r($e->getMessage());
        }
        return $result;
    }

    public function update($id_jenis, $nama_jenis)
    {
        $data = $this->db->prepare("UPDATE jenis_barang SET nama_jenis = ? WHERE id_jenis = ?");

        $data->bindParam(1, $nama_jenis);
        $data->bindParam(2, $id_jenis);
        try
        {
            $result = $data->execute();
        }
        catch(PDOExveption $e)
        {
            print_r($e->getMessage());
        }
        return $result;
    }

    public function delete($id_jenis)
    {
        $data = $this->db->prepare("DELETE FROM jenis_barang WHERE id_jenis = ?");
        $data->bindParam(1, $id_jenis);
        try
        {
            $result = $data->execute();
        }
        catch(PDOExveption $e)
        {
            print_r($e->getMessage());
        }
        return $result;
    }


}

$data = new jenisbarang;

?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Marem Seafood</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="img/favicon.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: NiceAdmin - v2.4.1
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>
<?php
if(isset($_POST['submit'])){

    $id_jenis = $_POST ['id_jenis'];
    $nama_jenis = $_POST ['nama_jenis'];
    $data->store($id_jenis, $nama_jenis);
    $_SESSION["sukses"] = 'Data Berhasil Disimpan';

}

if(isset($_POST['update'])){

    $id_jenis = $_POST ['id_jenis'];
    $nama_jenis = $_POST ['nama_jenis'];
    $data->update($id_jenis, $nama_jenis);
    $_SESSION["sukses"] = 'Data Berhasil Disimpan';

}

if(isset($_POST['delete'])){

    $id_jenis = $_POST ['id_jenis'];
    $data->delete($id_jenis);
    $_SESSION["sukses"] = 'Data Berhasil Disimpan';

}
?>

  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="index.html" class="logo d-flex align-items-center">
        <img src="img/logo.png" alt="">
        <span class="d-none d-lg-block">Marem Seafood</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

    <div class="search-bar">
      <form class="search-form d-flex align-items-center" method="POST" action="#">
        <input type="text" name="query" placeholder="Search" title="Enter search keyword">
        <button type="submit" title="Search"><i class="bi bi-search"></i></button>
      </form>
    </div><!-- End Search Bar -->

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">

        <li class="nav-item d-block d-lg-none">
          <a class="nav-link nav-icon search-bar-toggle " href="#">
            <i class="bi bi-search"></i>
          </a>
        </li><!-- End Search Icon-->

        <li class="nav-item dropdown">

          <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
            <i class="bi bi-bell"></i>
            <span class="badge bg-primary badge-number">4</span>
          </a><!-- End Notification Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
            <li class="dropdown-header">
              You have 4 new notifications
              <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-exclamation-circle text-warning"></i>
              <div>
                <h4>Lorem Ipsum</h4>
                <p>Quae dolorem earum veritatis oditseno</p>
                <p>30 min. ago</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-x-circle text-danger"></i>
              <div>
                <h4>Atque rerum nesciunt</h4>
                <p>Quae dolorem earum veritatis oditseno</p>
                <p>1 hr. ago</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-check-circle text-success"></i>
              <div>
                <h4>Sit rerum fuga</h4>
                <p>Quae dolorem earum veritatis oditseno</p>
                <p>2 hrs. ago</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-info-circle text-primary"></i>
              <div>
                <h4>Dicta reprehenderit</h4>
                <p>Quae dolorem earum veritatis oditseno</p>
                <p>4 hrs. ago</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>
            <li class="dropdown-footer">
              <a href="#">Show all notifications</a>
            </li>

          </ul><!-- End Notification Dropdown Items -->

        </li><!-- End Notification Nav -->

        <li class="nav-item dropdown">

          <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
            <i class="bi bi-chat-left-text"></i>
            <span class="badge bg-success badge-number">3</span>
          </a><!-- End Messages Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages">
            <li class="dropdown-header">
              You have 3 new messages
              <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="message-item">
              <a href="#">
                <img src="img/messages-1.jpg" alt="" class="rounded-circle">
                <div>
                  <h4>Maria Hudson</h4>
                  <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
                  <p>4 hrs. ago</p>
                </div>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="message-item">
              <a href="#">
                <img src="img/messages-2.jpg" alt="" class="rounded-circle">
                <div>
                  <h4>Anna Nelson</h4>
                  <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
                  <p>6 hrs. ago</p>
                </div>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="message-item">
              <a href="#">
                <img src="img/messages-3.jpg" alt="" class="rounded-circle">
                <div>
                  <h4>David Muldon</h4>
                  <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
                  <p>8 hrs. ago</p>
                </div>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="dropdown-footer">
              <a href="#">Show all messages</a>
            </li>

          </ul><!-- End Messages Dropdown Items -->

        </li><!-- End Messages Nav -->

        <li class="nav-item dropdown pe-3">

          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <img src="img/profile-img.jpg" alt="Profile" class="rounded-circle">
            <span class="d-none d-md-block dropdown-toggle ps-2">Admin Marem</span>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6>Supadi</h6>
              <span>Admin Marem</span>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                <i class="bi bi-person"></i>
                <span>My Profile</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                <i class="bi bi-gear"></i>
                <span>Account Settings</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="pages-faq.html">
                <i class="bi bi-question-circle"></i>
                <span>Need Help?</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="#">
                <i class="bi bi-box-arrow-right"></i>
                <span>Sign Out</span>
              </a>
            </li>

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->

      </ul>
    </nav><!-- End Icons Navigation -->

  </header><!-- End Header -->

  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">
      <li class="nav-item">
        <a class="nav-link" href="index.php">
          <i class="bi bi-grid"></i>
          <span>Dashboard</span>
        </a>
      </li><!-- End Dashboard Nav -->
      
      <li class="nav-item">
        <a class="nav-link collapsed" href="barang.php">
          <i class="bi bi-laptop"></i>
          <span>Barang</span>
        </a>
      </li><!-- End Dashboard Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed " href="calon-konsumen.php">
          <i class="bi bi-person-circle"></i>
          <span>Calon Konsumen</span>
        </a>
      </li><!-- End Dashboard Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="jabatan.php">
          <i class="bi bi-kanban"></i>
          <span>Jabatan</span>
        </a>
      </li><!-- End Dashboard Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="jenis-barang.php">
          <i class="bi bi-grid"></i>
          <span>Jenis Barang</span>
        </a>
      </li><!-- End Dashboard Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-pip-fill"></i><span>Katalog</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="katalog-barang.php">
              <i class="bi bi-circle"></i><span>Katalog Barang</span>
            </a>
          </li>
          <li>
            <a href="detail-katalog.php">
              <i class="bi bi-circle"></i><span>Detail Katalog</span>
            </a>
          </li>
        </ul>
      </li><!-- End Forms Nav -->


      <li class="nav-item">
        <a class="nav-link collapsed" href="negara.php">
          <i class="bi bi-flag-fill"></i>
          <span>Negara</span>
        </a>
      </li><!-- End Dashboard Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="pegawai.php">
          <i class="bi bi-file-earmark-person "></i>
          <span>Pegawai</span>
        </a>
      </li><!-- End Dashboard Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-cart"></i><span>Pemesanan</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="pemesanan.php">
              <i class="bi bi-circle"></i><span>Pemesanan</span>
            </a>
          </li>
          <li>
            <a href="detail-pemesanan.php">
              <i class="bi bi-circle"></i><span>Detail Pemesanan</span>
            </a>
          </li>
        </ul>
      </li><!-- End Forms Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-graph-up"></i><span>Penawaran</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="penawaran.php">
              <i class="bi bi-circle"></i><span>Penawaran</span>
            </a>
          </li>
          <li>
            <a href="detail-penawaran.php">
              <i class="bi bi-circle"></i><span>Detail Penawaran</span>
            </a>
          </li>
        </ul>
      </li><!-- End Forms Nav -->
    </ul>

  </aside><!-- End Sidebar-->
  
  <main id="main" class="main">
    <div class="pagetitle">
      <h1>Data Jenis Barang</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.php">Home</a></li>
          <li class="breadcrumb-item"><a href="jenis-barang.php">Data Jenis Barang</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
      <div class="row">

        <!-- Left side columns -->
        <div class="col-lg-8">
          <div class="row">

          </div>
        </div><!-- End Left side columns -->

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Data Jenis Barang</h5>
           
              <!-- Bordered Table -->
              <div class="container-fluid my-4">

<div class="d-flex justify-content-end">
    <a class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#insert">Insert Data Jenis Barang</a>
</div>
<div class="modal fade" id="insert" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Insert Data Jenis Barang</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <form method="POST">
            <div class="row d-flex align-items-center justify-content-between my-3">
                <div class="col-5">ID</div>
                <div class="col-lg-7">
                    <input required class="form-control" type="text" name="id_jenis" placeholder="ID Jenis Barang">
                </div>
            </div>
            <div class="row d-flex align-items-center justify-content-between my-3">
                <div class="col-5">Nama Jenis</div>
                <div class="col-lg-7">
                    <input required class="form-control" type="text" name="nama_jenis" placeholder="Nama Jenis Barang">
                </div>
            </div>



        </div>
        <div class="row d-flex justify-content-center">

            <div class="col-7 col-md-5 col-xl-5 mb-4">
                <button type="submit" name="submit" class="btn bg-primary text-white col">Simpan Perubahan</button>
            </form>
            </div>
        </div>

    </div>
    </div>
</div>

<!-- End Forms bordered -->
    <thead>
                <table class="table table-bordered">
                <tr>
                   <th>ID</th>
                   <th>Nama Jenis</th>
                   <th>Aksi</th>
                   </tr>
                </thead>
                <tbody>
                <?php foreach ($data->show() as $value): ?>
                                        <tr>
                                            <td><?= $value['id_jenis'] ?></td>
                                            <td><?= $value['nama_jenis'] ?></td>
                                            <td>
                                                <div class="d-flex justify-content-center">
                                                    <button class="btn btn-sm btn-warning mx-1" data-bs-toggle="modal" data-bs-target="#update<?php echo $value['id_jenis']; ?>">Update</button>
                                                    <button class="btn btn-sm btn-danger mx-1" data-bs-toggle="modal" data-bs-target="#delete<?php echo $value['id_jenis']; ?>">delete</button>
                                                </div>
                                            </td>
                                        </tr>
                                        <div class="modal fade" id="update<?php echo $value['id_jenis']; ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Update Data Jenis Barang</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <form method="POST">
                                                <input required class="form-control" type="hidden" name="id_jenis" value="<?php echo $value['id_jenis'] ?>">

                                                <div class="row d-flex align-items-center justify-content-between my-3">
                                                    <div class="col-5">Nama Jenis Barang</div>
                                                    <div class="col-lg-7">
                                                        <input required class="form-control" type="text" name="nama_jenis"  value="<?php echo $value['nama_jenis'] ?>">
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="row d-flex justify-content-center">

                                                <div class="col-7 col-md-5 col-xl-5 mb-4">
                                                    <button type="submit" name="update" class="btn bg-primary text-white col">Simpan Perubahan</button>
                                                </form>
                                                </div>
                                            </div>

                                        </div>
                                        </div>
                                    </div>
                                        <div class="modal fade" id="delete<?php echo $value['id_jenis']; ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Delete Data Jenis Barang</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <form method="POST">
                                                    <input required class="form-control" type="hidden" name="id_jenis" value="<?php echo $value['id_jenis'] ?>">

                                                    <div class="modal-body">Apakah Anda Yakin Menghapus?</div>
                                                    <div class="modal-footer">
                                                        <button type="submit" name="delete" class="btn bg-primary text-white col">Ya</button>
                                                    </div>
                                                    </form>
                                                </div>

                                            </div>
                                            </div>
                                        </div>
                                    <?php endforeach ?>
                </tbody>
              </table>
                                                  
              <!-- End Bordered Table -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="vendor/apexcharts/apexcharts.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="vendor/chart.js/chart.min.js"></script>
  <script src="vendor/echarts/echarts.min.js"></script>
  <script src="vendor/quill/quill.min.js"></script>
  <script src="vendor/simple-datatables/simple-datatables.js"></script>
  <script src="vendor/tinymce/tinymce.min.js"></script>
  <script src="vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="js/main.js"></script>
  <?php if(@$_SESSION['sukses']){ ?>
        <script>
            swal("Good job!", "<?php echo $_SESSION['sukses']; ?>", "success");
        </script>
    <!-- jangan lupa untuk menambahkan unset agar sweet alert tidak muncul lagi saat di refresh -->
    <?php unset($_SESSION['sukses']); } ?>
</body>

</html>