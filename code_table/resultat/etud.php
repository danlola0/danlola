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
    
<h1>Selectionner un etudiant</h1>


 
<section class="ll">

<table class="tableau ">

    <thead>

        <tr>

            <th>Num</th>
            <th>Nom</th>
            <th>postom</th>
            <th>prenom</th>


        </tr>
        <?php 
$bd=new PDO('mysql:host=localhost;dbname=deliberation','root','');
$idDep=$_GET['id_departement'];
$idPromo=$_GET['id_promo'];
$sql=$bd->query('SELECT* FROM t_etudiant where idPromo='.$idPromo);
$index=1;
while( $aff=$sql->fetch()){?>
    </thead>

    <tbody>
        <tr>
            <td> <?= $index ?> </td>
            <td><a href="http://localhost/danlola/menu.php/?page=result&deliberation=delib&id_departement=<?= $idDep ?>&id_promo=<?= $idPromo ?>&id_etudiant=<?= $aff['id'] ?>"><?php echo $aff['nom']; ?></a></td>
            <td><a href="http://localhost/danlola/menu.php/?page=result&deliberation=delib&id_departement=<?= $idDep ?>&id_promo=<?= $idPromo ?>&id_etudiant=<?= $aff['id'] ?>"><?php echo $aff['postnom']; ?></a></td>
            <td><a href="http://localhost/danlola/menu.php/?page=result&deliberation=delib&id_departement=<?= $idDep ?>&id_promo=<?= $idPromo ?>&id_etudiant=<?= $aff['id'] ?>"><?php echo $aff['prenom']; ?></a></td>

        </tr>

    </tbody>
    <?php $index++; } ?>

</table>


</section>

</body>

</html>