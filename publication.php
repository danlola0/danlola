<?php
session_start();
?>

<!DOCTYPE html> 
<html lang="en"> 
<head> 
    <meta charset="UTF-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <meta http-equiv="X-UA-Compatible" content="ie=edge"> 
    <title>Resultat</title> 
</head> 
<body> 
     
<h1>Bienvenu(e) A ton dashbord de resultat</h1> 
<?php
if(isset($_SESSION['nom'])){
echo 'Vous êtes connecter ' . $_SESSION['nom'];
}


?>
 
<form action="" method="post"> 
    <label for="code">Entrer votre code</label> 
    <input type="number" name="code" id="code" placeholder="Votre code d'autentification"> <br> 
    <input type="submit" value="Envoyer"> 
</form> 
 
<?php 
if(isset($_POST['code'])){  
    $resultat=$_POST['code'];  
    if($resultat==1){  
    

    header('location:http://localhost/danlola/fpdf/coupons.php?id=1');
    
    }else if($resultat==2){  
    header('location:http://localhost/danlola/fpdf/coupons.php?id=2');
          
    }  
    else if($resultat==5){  
    header('location:http://localhost/danlola/fpdf/coupons.php?id=5');
         
    }  
    else{  
        header('location:http://localhost/danlola/publication.php');
    
    }  
}  
?> 
 
</body> 
</html>