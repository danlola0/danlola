<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../css/menu.css">
    <link rel="stylesheet" href="../css/tableau.css">
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
    <th>Gmail</th>
    <th>Fonction</th>
    <th>postnom</th>
    <th>Password</th>
    <th>Action</th>
    
    </tr>
    <?php 
    $bd=new PDO('mysql:host=localhost;dbname=deliberation','root','');    
    $sql=$bd->query('SELECT* FROM admin');
    while($aff=$sql->fetch()){?>


    </thead>
    
    <tbody>
    <tr>
    <td><?php echo $aff['id']; ?></td>
    <td><?php echo $aff['nom']; ?></td>
    <td><?php echo $aff['gmail']; ?></td>
    <td><?php echo $aff['fonction']; ?></td>
    <td><?php echo $aff['postnom']; ?></td>
    <td><?php echo $aff['password']; ?></td>
    <td><a href="http://localhost/danlola/modifier.php?id=<?php echo $aff['id'];  ?>"><i class="fa-solid fa-pen-to-square"></i></a>   <a href="http://localhost/danlola/supprimeradmin.php?id=<?php echo $aff['id']; ?>"><i class="fa-solid fa-trash"></i></a>  <a href="http://localhost/danlola/ajout_admin.php"> <i class="fa-solid fa-plus"></i></a></td> </td>
    
    </tr>
    
    </tbody>
    
<?php }?>
    
    </table>


    </section>
    

</body>
</html>