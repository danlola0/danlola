<?php   
session_start();

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/menu.css">
    <link rel="stylesheet" href="./code_table/t.css">

    <title>Menu général</title>
</head>

<body>
    <nav>
        <h1>Menu</h1>
        <ul>
            <li><a href="http://localhost/danlola/menu.php/?page=etudiant"> Etudiant</a></li>
            <li><a href="http://localhost/danlola/menu.php/?page=cours"> Cours</a></li>
            <li><a href=""> Promotion</a></li>

            <li><a href="http://localhost/danlola/menu.php/?page=departement"> Département</a></li>

            <li><a href="http://localhost/danlola/menu.php/?page=result&deliberation=depart"> Resultat</a></li>
            <li><a href="http://localhost/danlola/menu.php/?page=utilsateur"> Utilisateur</a></li>
          

            <li><a href="http://localhost/danlola">Se deconnecter</a></li>
        </ul>

    </nav>
    <section>
        <div class=" content">


            <?php 
if(isset($_SESSION['nom'])){
echo 'Vous êtes connecter   Mr.' .$_SESSION['nom'] ;

}



?>




            <?php 

if(isset($_GET['page'])){
    $page=$_GET['page'];
     
            include('code_table/'.$page.'.php');
             
        

        }



?>


        </div>




    </section>

</body>

</html>