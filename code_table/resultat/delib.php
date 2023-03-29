<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../menu.css">
    <link rel="stylesheet" href="../css/etudiant.css">
    <title>Resultat</title>
</head>

<body>

    <h1>Deliberer un etudiant</h1>



    <section class="ll">


        <form action="" method="post">

            <?php 
$bd=new PDO('mysql:host=localhost;dbname=deliberation','root','');
$idDep=$_GET['id_departement'];
$idPromo=$_GET['id_promo'];
$idEtudiant=$_GET['id_etudiant'];
$sql=$bd->query('SELECT* FROM t_cour where idPromo='.$idPromo);
$index=1;
while( $aff=$sql->fetch()){?>

            <ul>
                <li><span><?=$aff['nom']?></span> <input type="number" name="<?=$aff['id']?>" id=""></li>
            </ul>
            <!-- <input type="hidden" name="deliberer"> -->
            <?php $index++; } ?>

            <button type="submit">Deliberer</button>
        </form>
    </section>

</body>

</html>




<?php

if(!empty($_POST)){
 var_dump($_POST);
 foreach($_POST as $key=>$cote){
    echo "id:".$key." Cote: ".$cote;
    $sql=$bd->query('insert into t_deliberation (idEtudiant, idCour, cote) values ('.$idEtudiant.', '.$key.', '.$cote.')');
    }
   
}

?>