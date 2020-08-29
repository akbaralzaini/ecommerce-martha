<?php include 'includes/session.php'; ?>
<?php
	if(!isset($_SESSION['user'])){
		header('location: index.php');
	}
?>
<?php include 'includes/header.php'; ?>
<body class="hold-transition skin-blue layout-top-nav">
<div class="wrapper">

	<?php include 'includes/navbar.php'; ?>
	 
	  <div class="content-wrapper">
	    <div class="container">

	      <!-- Main content -->
	      <section class="content">
	        <div class="row">
	        	<div class="col-sm-9">
	        		<?php
	        			if(isset($_SESSION['error'])){
	        				echo "
	        					<div class='callout callout-danger'>
	        						".$_SESSION['error']."
	        					</div>
	        				";
	        				unset($_SESSION['error']);
	        			}

	        			if(isset($_SESSION['success'])){
	        				echo "
	        					<div class='callout callout-success'>
	        						".$_SESSION['success']."
	        					</div>
	        				";
	        				unset($_SESSION['success']);
	        			}
	        		?>
	        		<div class="box box-solid">
	        			<div class="box-body">
	        				<div class="col-sm-3">
	        					<img src="<?php echo (!empty($user['photo'])) ? 'images/'.$user['photo'] : 'images/profile.jpg'; ?>" width="100%">
	        				</div>
	        				<div class="col-sm-9">
	        					<div class="row">
	        						<div class="col-sm-3">
	        							<h4>Name:</h4>
	        							<h4>Email:</h4>
	        							<h4>Contact Info:</h4>
	        							<h4>Address:</h4>
	        							<h4>Member Since:</h4>
	        						</div>
	        						<div class="col-sm-9">
	        							<h4><?php echo $user['firstname'].' '.$user['lastname']; ?>
	        								<span class="pull-right">
	        									<a href="#edit" class="btn btn-success btn-flat btn-sm" data-toggle="modal"><i class="fa fa-edit"></i> Edit</a>
	        								</span>
	        							</h4>
	        							<h4><?php echo $user['email']; ?></h4>
	        							<h4><?php echo (!empty($user['contact_info'])) ? $user['contact_info'] : 'N/a'; ?></h4>
	        							<h4><?php echo (!empty($user['address'])) ? $user['address'] : 'N/a'; ?></h4>
	        							<h4><?php echo date('M d, Y', strtotime($user['created_on'])); ?></h4>
	        						</div>
	        					</div>
	        				</div>
	        			</div>
	        		</div>
	        		<div class="box box-solid">
	        			<div class="box-header with-border">
	        				<h4 class="box-title"><i class="fa fa-calendar"></i> <b>Transaction History</b></h4>
	        			</div>
	        			<div class="box-body">
	        				<table class="table table-bordered" id="example1">
	        					<tbody>
	        					<?php
	        						$conn = $pdo->open();

	        						try{
	        							$stmt = $conn->prepare("SELECT * FROM sales WHERE id=:id ORDER BY sales_date DESC");
	        							$stmt->execute(['id'=>$_GET['id']]);
	        							foreach($stmt as $row){
	        								$stmt2 = $conn->prepare("SELECT * FROM details LEFT JOIN products ON products.id=details.product_id WHERE sales_id=:id");
	        								$stmt2->execute(['id'=>$row['id']]);
	        								$total = 0;
	        								foreach($stmt2 as $row2){
	        									$subtotal = $row2['price']*$row2['quantity'];
	        									$total += $subtotal;
	        								}
	        								echo "
	        										<tr>
	        											<td>Date </td>
	        											<td>".date('M d, Y', strtotime($row['sales_date']))."</td></tr>
	        										<tr>
	        											<td>ID Transaksi</td>
	        											<td>".$row['pay_id']."</td></tr>
	        										<tr>
	        											<td>Jumlah bayar </td>
	        											<td>Rp. ".number_format($total, 2)."</td></tr>
	        										
	        								";
	        							}

	        						}
        							catch(PDOException $e){
										echo "There is some problem in connection: " . $e->getMessage();
									}

	        						$pdo->close();
	        					?>
	        					<form method="POST" action="update_payment.php?id=<?= $_GET['id'] ?>" enctype="multipart/form-data">
		        					<tr>
		        						<td>Bank</td>
		        						<td>
		        							<select class="form-control" name="bank" id="sel1">
						                        <option value="MANDIRI">MANDIRI</option>
						                        <option value="BCA">BCA</option>
						                        <option value="BRI">BRI</option>
						                        <option value="BNI">BNI</option>
						                      </select>
		        						</td>
		        					</tr>
		        					<tr>
		        						<td>Bukti Bayar</td>
		        						<td><input type="file" id="photo" name="photo"></td>
		        					</tr>
		        					<tr>
		        						<td>
		        						<input type="submit" name="bayar" class="btn btn-primary" value="Bayar">
		        						</td>
		        					</tr>
	        					</form>
	        					</tbody>
	        				</table>
	        			</div>
	        		</div>
	        	</div>
	        	<div class="col-sm-3">
	        		<?php include 'includes/sidebar.php'; ?>
	        	</div>
	        </div>
	      </section>
	     
	    </div>
	  </div>
  
  	<?php include 'includes/footer.php'; ?>
  	<?php include 'includes/profile_modal.php'; ?>
</div>

<?php include 'includes/scripts.php'; ?>
<script>
$(function(){
	$(document).on('click', '.transact', function(e){
		e.preventDefault();
		$('#transaction').modal('show');
		var id = $(this).data('id');
		$.ajax({
			type: 'POST',
			url: 'transaction.php?id'+id,
			data: {id:id},
			dataType: 'json',
			success:function(response){
				$('#date').html(response.date);
				$('#transid').html(response.transaction);
				$('#detail').prepend(response.list);
				$('#total').html(response.total);
				$('#status').html(response.status);

			}
		});
	});

	$("#transaction").on("hidden.bs.modal", function () {
	    $('.prepend_items').remove();
	});
});
</script>
</body>
</html>