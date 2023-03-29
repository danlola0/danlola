<?php 
try{
	$bd=new PDO('mysql:host=localhost;dbname=deliberation','root','');
	
}catch(PDOException $e){
	echo 'erreur ' .$e;
}


if(isset($_POST['enregistrer'])){
if(isset($_POST['nom']) and isset($_POST['gmail']) and isset($_POST['fonction']) and 
 isset($_POST['postnom']) and isset($_POST['password'])){

$sql=$bd->prepare('INSERT INTO admin values (null ,:nom ,:gmail,:fonction,:postnom,:password)');
$sql->bindValue(':nom',$_POST['nom']);
$sql->bindValue(':gmail',$_POST['gmail']);
$sql->bindValue(':fonction',$_POST['fonction']);
$sql->bindValue(':postnom',$_POST['postnom']);
$sql->bindValue(':password',$_POST['password']);
$resu=$sql->execute();
header('location:http://localhost/danlola/menu.php/?page=1');
}else{
	echo 'erreur sur le code ';
}    

}





?>




<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/ajout_admin.css">
    <title>Crée un compte Admin</title>
</head>
<body>

	<div class="main-w3layouts wrapper">
		<h1>Nouvel Utilisateur</h1>
		<div class="main-agileinfo">
			<div class="agileits-top">
				<form action=" " method="post">
					<input class="text" type="text" name="nom"   placeholder="Votre nom" required="">
					<input class="text email" type="email" name="gmail"   placeholder="Votre Email" required="">
					<input class="text" type="text" name="fonction"    placeholder=" Saisissez votre fonction" required="">
                    
            <input class="text w3lpass" type="text" name="postnom"  placeholder="votre postnom" required="">
					<input class="text w3lpass" type="password"  name="password" placeholder="votre Mot de passe " required="">

					<div class="wthree-text">
						<label class="anim">
							
						</label>
						<div class="clear"> </div>
					</div>
					<input type="submit"  name ="enregistrer"value="Enregistrer">
				</form>
				
			</div>
		</div>
	



</body>
</html>