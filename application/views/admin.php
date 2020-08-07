<!DOCTYPE html>
<html>
<head>
	<title></title>
	<?php

	?>
</head>
<body>
	<?php echo $header;  ?>
	<table class="table table-stripped table-bordered" id="karyawan">
		<tr>
			<th>Id</th>
			<th>Nama produk</th>
			<th>QTY per Unit</th>
			<th>Price</th>
		</tr>

		<?php 
			foreach ($product as $row) {
				$id_product = $row['id'];
				$product_name = $row['product_name'];
				$qty_per_unit = $row['quantity_per_unit'];
				$price = $row['list_price'];

				echo "<tr>";
				echo "<td>".$id_product."</td>";
				echo "<td>".$product_name."</td>";
				echo "<td>".$qty_per_unit."</td>";
				echo "<td>".$price."</td>";
				echo "</tr>";
			}
		?>
	</table>
	<?php echo $footer;  ?>
</body>
</html>