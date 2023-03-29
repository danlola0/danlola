

<!DOCTYPE html> 
<html lang="en"> 
<head> 
 <meta charset="UTF-8"> 
 <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
 <meta http-equiv="X-UA-Compatible" content="ie=edge"> 
    <link rel="stylesheet" href="../css/menu.css"> 
    <link rel="stylesheet" href="../css/etudiant.css"> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" /> 
 <title>Utilisateur</title> 
</head> 
<body> 
 <section class="ll"> 
  <table class="tableau "> 
    <thead> 
    <tr> 
    <th>Num</th> 
    <th>Nom</th> 
    <th>Postnom</th> 
    <th>Prenom</th> 
    <th>code promotion</th> 
    <th>date_naissance</th> 
    <th>Matricule</th> 
    <th>Action</th> 
    </tr> 
   <?php  
   $bd=new PDO('mysql:host=localhost;dbname=deliberation','root',''); 
   $sql=$bd->query('SELECT* FROM t_etudiant'); 
   while($aff=$sql->fetch()){ 
   ?>  
    </thead> 
    <tbody> 
    <tr> 
    <td> <?php echo $aff['id'] ;  ?> </td> 
    <td>  <?php echo $aff['nom'] ;  ?></td> 
    <td> <?php echo $aff['postnom'] ;  ?></td> 
    <td> <?php echo $aff['prenom'] ;  ?></td> 
    <td> <?php echo $aff['idPromo'] ;  ?></td> 
    <td>  <?php echo $aff['date_naissance'] ;  ?></td> 
    <td> <?php echo $aff['matricule'] ;  ?></td> 
    <td>
        <a href="http://localhost/danlola/ajout_etudiant.php"><i class="fa-solid fa-address-book"></i></a>  
        <a href="http://localhost/danlola/modifier_etudiant.php"><i class="fa-sharp fa-solid fa-pen-to-square"></i></a>     
        <a href="http://localhost/danlola/supprimer_etudiant.php"><i class="fa-solid fa-trash"></i></a> 
        <a href="http://localhost/danlola/fpdf/coupons.php?id=<?php echo $aff['id']; ?>">Resultat</a>
    </td> 
    </tr> 
    </tbody>
   <?php } ?> 
  </table> 
 </section> 
<?php  
if(isset($_GET['id'])){ 
$resultat=$_GET['id']; 
if($resultat==1){ 
include('http://localhost/danlola/fpdf/coupons.php?id=1'); 
}else if($resultat==2){ 
    include('http://localhost/danlola/fpdf/coupons.php?id=2'); 
} 
else if($resultat==5){ 
    include('http://localhost/danlola/fpdf/coupons.php?id=5'); 
} 
else{ 
echo 'erreur'; 
} 
}   
?> 
</body> 
</html>

