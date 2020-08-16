<div class="row">
	<div class="box box-solid">
	  	<div class="box-header with-border">
	    	<h3 class="box-title"><b>Suggestion For You</b></h3>
	  	</div>
	  	<div class="box-body">
	  		<ul id="trending">
	  		<?php
	  			//include 'includes/session.php'
		  		if (isset($_SESSION['user'])) {
		  			$now = $_SESSION['user'];
		  			$conn = $pdo->open();
		  			//$category_id = $_POST['category_id'];
		  			//$id = $_POST['id'];
		  			$suggest = 1;
		  			$stmt = $conn->prepare("SELECT * FROM cart WHERE user_id=:user_id");
		  			$stmt->execute(['user_id'=>$now]);

		  			foreach ($stmt as $row) {
		  				$product_id = $row['product_id'];
		  				$stmt1 = $conn->prepare("SELECT * FROM predict WHERE id_product1=:product_id");
		  				$stmt1->execute(['product_id'=>$product_id]);
		  				foreach ($stmt1 as $key) {
		  					$product_id1 = $key['id_product2'];
		  					$stmt11 = $conn->prepare("SELECT * FROM products WHERE id=:id");
		  					$stmt11->execute(['id'=>$product_id1]);

		  					$product_id3 = $key['id_product3'];
		  					$stmt13 = $conn->prepare("SELECT * FROM products WHERE id=:id");
		  					$stmt13->execute(['id'=>$product_id3]);

		  					foreach ($stmt11 as $key1);
		  					echo "<li><a href='product.php?product=".$key1['id']."'>".$key1['name']."</a></li>";

		  					foreach ($stmt13 as $key3);
		  					echo "<li><a href='product.php?product=".$key3['id']."'>".$key3['name']."</a></li>";
		  					
		  				}
		  				
					}  
		  			$pdo->close();
		  		}
		  		else{
		  			echo "<a href='login.php'>Anda Harus Login dahulu</a>";
		  		}
	  		?>
	    	<ul>
	  	</div>
	</div>
</div>

<div class="row">
	<div class="box box-solid">
	  	<div class="box-header with-border">
	    	<h3 class="box-title"><b>Become a Subscriber</b></h3>
	  	</div>
	  	<div class="box-body">
	    	<p>Get free updates on the latest products and discounts, straight to your inbox.</p>
	    	<form method="POST" action="">
		    	<div class="input-group">
	                <input type="text" class="form-control">
	                <span class="input-group-btn">
	                    <button type="button" class="btn btn-info btn-flat"><i class="fa fa-envelope"></i> </button>
	                </span>
	            </div>
		    </form>
	  	</div>
	</div>
</div>

<div class="row">
	<div class='box box-solid'>
	  	<div class='box-header with-border'>
	    	<h3 class='box-title'><b>Follow us on Social Media</b></h3>
	  	</div>
	  	<div class='box-body'>
	    	<a class="btn btn-social-icon btn-facebook"><i class="fa fa-facebook"></i></a>
	    	<a class="btn btn-social-icon btn-twitter"><i class="fa fa-twitter"></i></a>
	    	<a class="btn btn-social-icon btn-instagram"><i class="fa fa-instagram"></i></a>
	    	<a class="btn btn-social-icon btn-google"><i class="fa fa-google-plus"></i></a>
	    	<a class="btn btn-social-icon btn-linkedin"><i class="fa fa-linkedin"></i></a>
	  	</div>
	</div>
</div>
