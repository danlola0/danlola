<?php
session_start();
try{

	$bd=new PDO('mysql:host=localhost;dbname=deliberation','root','');
	
	}catch(ExceptionPDO $e){
	
	echo 'erreur' .$e;
	
	}

if(isset($_POST['re'])){

	if(!empty($_POST['nom']) || !empty($_POST['matricule'])){
	 

		$code=('SELECT nom,matricule FROM t_etudiant where nom=:nom and matricule=:matricule ');
		$resu=$bd->prepare($code);
		$resu->execute(array('nom'=>$_POST['nom'] , 'matricule'=>$_POST['matricule'] ) );
		$count=$resu->rowCount();
		if($count>0){
		$SESSION['nom']=$_POST['nom'];
		header('location:http://localhost/danlola/publication.php');

		
		}else{


	header('location:http://localhost/danlola/');
    
    


		} 



	}
	
	
	
	}




?>

<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Création de compte</title>
  <link rel="stylesheet" href="./style.css">

</head>
<body>
<!-- partial:index.partial.html -->
<!DOCTYPE html>
<html>
<head>
	<title>Slide Navbar</title>
	<link rel="stylesheet" type="text/css" href="slide navbar style.css">
<link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
</head>
<body>
	<div class="main">  	
		<input type="checkbox" id="chk" aria-hidden="true">

			<div class="signup">
				<form  action="" method="post">
					<label for="chk" aria-hidden="true">S'inscrire</label>
					<input type="text" name="nom" placeholder="Entrer votre nom" autocomplet='off' required="">
					<input type="email" name="gmail" placeholder="Entrer votre gmail"  autocomplet='off'  required="">
					<input type="password" name="password" placeholder="Mot de passe" autocomplet='off' required="">
					<button type="submit" name="enregistrer">Enregistrer</button>   
				</form>
			</div>

			<div class="login">
				<form  action=""  method="post">
					<label for="chk" aria-hidden="true">Connecter</label>
					<input type="text" name="nom" placeholder="nom d'utilisateur" required="">
					<input type="number" name="matricule" placeholder="Password" required="">
					<button type="submit" name="re">Connecter</button>
				</form>
			</div>
	</div>
</body>
</html>
<!-- partial -->
  
</body>
</html>


<?php
if(isset($_POST['enregistrer'])){

if(isset($_POST['nom']) and isset($_POST['gmail']) and isset($_POST['password']) ){

$sql=$bd->prepare('INSERT INTO login values(null,:nom ,:gmail ,:password)');
$sql->bindValue(':nom',$_POST['nom']);
$sql->bindValue(':gmail',$_POST['gmail']);
$sql->bindValue(':password',$_POST['password']);
$rece=$sql->execute();

header('location:connexion.php');

}

}
?>