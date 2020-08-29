<div class="row">
	<div class="box box-solid">
	  	<div class="box-header with-border">
	    	<h3 class="box-title"><b>Rekomendasi Produk</b></h3>
	  	</div>
	  	<div class="box-body">
	  		<table>
	  		<?php
	  			$now = date('Y-m-d');
	  			$conn = $pdo->open();

	  			$stmt = $conn->prepare("SELECT * FROM products WHERE date_view=:now ORDER BY counter DESC LIMIT 10");
	  			$stmt->execute(['now'=>$now]);
	  			foreach($stmt as $row){ 
	  				$image = (!empty($row['photo'])) ? 'images/'.$row['photo'] : 'images/noimage.jpg'; ?>
	  					<tr style="height: 10px"><td></td></tr>
	  					<tr style="">
	  						<td><img length="50px" width="50px" src="<?= $image ?>"></td>
	  						<td width="50%"><a href="product.php?product=<?= $row['slug'] ?>"> <?= $row['name'] ?></a></td>
	  						<td >Rp. <?= $row['price'] ?></td>
	  					</tr>
	  					<tr style="border-bottom: 1px solid black;height: 10px"><td></td></tr>

	  			<?php
	  			}

	  			$pdo->close();
	  		?>

	  		</table>
	  	</div>
	</div>
</div>
