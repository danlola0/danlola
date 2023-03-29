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
    
<h1>Selectionner un departement</h1>


 <section class="ll">

<table class="tableau ">

    <thead>

        <tr>

            <th>Num</th>
            <th>Nom Departement</th>


        </tr>
        <?php 
$bd=new PDO('mysql:host=localhost;dbname=deliberation','root','');
$sql=$bd->query('SELECT* FROM t_departement');
while( $aff=$sql->fetch()){?>
    </thead>

    <tbody>
        <tr>
            <td> <?= $aff['id'] ?> </td>
            <td><a href="http://localhost/danlola/menu.php/?page=result&deliberation=promo&id_departement=<?= $aff['id'] ?>"><?php echo $aff['nom']; ?></a></td>

        </tr>

    </tbody>
    <?php } ?>

</table>


</section>

 
</body>

</html>