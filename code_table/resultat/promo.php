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
    
<h1>Selectionner une promotion</h1>


<section class="ll">

<table class="tableau ">

    <thead>

        <tr>

            <th>Num</th>
            <th>Nom Promotion</th>


        </tr>
        <?php 
$bd=new PDO('mysql:host=localhost;dbname=deliberation','root','');
$idDep=$_GET['id_departement'];
$sql=$bd->query('SELECT* FROM t_promotion where idDepartement='.$idDep);
$index=1;
while( $aff=$sql->fetch()){?>
    </thead>

    <tbody>
        <tr>
            <td> <?= $index ?> </td>
            <td><a href="http://localhost/danlola/menu.php/?page=result&deliberation=etud&id_departement=<?= $idDep ?>&id_promo=<?= $aff['id'] ?>"><?php echo $aff['nom']; ?></a></td>

        </tr>

    </tbody>
    <?php $index++; } ?>

</table>


</section>


</body>

</html>