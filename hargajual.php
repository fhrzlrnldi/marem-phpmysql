<?php

include('barang.php');

$new = new barang;

if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $sp = $new->tampilkanBarang($id);
}

// foreach ($data as $harga){
//     echo $harga['nama_barang'];
// }
?>
<table class="table">
  <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Jenis</th>
      <th scope="col">Barang</th>
      <th scope="col">Stok</th>
      <th scope="col">Berat</th>
      <th scope="col">Harga Jual</th>
    </tr>
  </thead>
  <tbody>
    <?php foreach($sp as $value){
      ?>
          <tr>
      <th scope="row">1</th>
      <td><?php echo $value['id_barang'];?></td>
      <td><?php echo $value['id_jenis'];?></td>
      <td><?php echo $value['nama_barang'];?></td>
      <td><?php echo $value['stok_barang'];?></td>
      <td><?php echo $value['berat_barang'];?></td>
      <td><?php echo $value['harga_jual'];?></td>
    </tr>
      <?php
    }?>
  </tbody>
</table>