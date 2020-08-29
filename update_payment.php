<?php
	include 'includes/session.php';

	$conn = $pdo->open();

	if(isset($_POST['bank'])){
		
		$bank = $_POST['bank'];
		$id = $_GET['id'];

		$photo = $_FILES['photo']['name'];
		if($bank){
			if(!empty($photo)){
				move_uploaded_file($_FILES['photo']['tmp_name'], 'images/bukti/'.$photo);
				$filename = $photo;	
			}
			else{
				$filename = $user['photo'];
			}

			try{
				$stmt = $conn->prepare("UPDATE sales SET bank=:bank,status=:status, foto=:photo WHERE id=:id");
				$stmt->execute(['bank'=>$bank,'status'=>'telah dibayar', 'photo'=>$filename, 'id'=>$id]);

				$_SESSION['success'] = 'Payment updated successfully';
			}
			catch(PDOException $e){
				$_SESSION['error'] = $e->getMessage();
			}
			
		}
		else{
			$_SESSION['error'] = 'Incorrect password';
		}
	}
	else{
		$_SESSION['error'] = 'Fill up edit form first';
	}

	$pdo->close();

	header('location: profile.php');

?>