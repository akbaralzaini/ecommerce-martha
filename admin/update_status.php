<?php
	include 'includes/session.php';

	$conn = $pdo->open();

	if(isset($_GET['id'])){
		
		$id = $_GET['id'];

		if($id){
			
			try{
				$stmt = $conn->prepare("UPDATE sales SET status=:status WHERE id=:id");
				$stmt->execute(['status'=>'dikonfirmasi', 'id'=> $id]);

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

	header('location: sales.php');

?>