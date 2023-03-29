<?php
$bd=new PDO('mysql:host=localhost;dbname=deliberation','root','');

if(isset($_GET['id'])){
$id=$_GET['id'];
$sql=$bd->query("SELECT * FROM admin WHERE id=$id");
$t=$sql->fetch();


}


?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/modifier.css">
    <title>Modification</title>
</head>
<body>

	<div class="main-w3layouts wrapper">
		<h1>Modification Utilisateur</h1>
		<div class="main-agileinfo">
			<div class="agileits-top">
				<form action=" " method="post">
					<input class="text" type="text" name="nom"  value="<?php echo $t['nom'] ; ?> "  placeholder="Votre nom" required="">
					<input class="text email" type="email" name="gmail"   value="<?php echo $t['gmail'] ; ?> "  placeholder="Votre Email" required="">
					<input class="text" type="text" name="fonction"    value="<?php echo $t['fonction'] ; ?> "  placeholder=" Saisissez votre fonction" required="">
                    
            <input class="text w3lpass" type="text" name="postnom"     value="<?php echo $t['postnom'] ; ?> "      placeholder="votre postnom" required="">
					<input class="text w3lpass" type="password"  value="<?php echo $t['password'] ; ?> " placeholder="votre Mot de passe " required="">

					<div class="wthree-text">
						<label class="anim">
							
						</label>
						<div class="clear"> </div>
					</div>
					<input type="submit"  name ="enregistrer"value="Modifier">
				</form>
				
			</div>
		</div>
	



</body>
</html>


<?php 
if(isset($_POST['enregistrer'])){
$nom=$_POST['nom'];
$gmail=$_POST['gmail'];
$fonction=$_POST['fonction'];
$postnom=$_POST['postnom'];
$password=$_POST['password'];

$code=$bd->prepare("UPDATE admin SET nom=?,gmail=?,fonction=?,postnom=?,password=? WHERE id=$id");
$ex=$code->execute(array($nom,$gmail,$fonction,$postnom,$password));
if($ex){

header('location:http://localhost/danlola/menu.php');


}
else{
echo 'erreur';

}




}





?>