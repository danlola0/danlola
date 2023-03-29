<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../css/menu.css">
    <link rel="stylesheet" href="../css/etudiant.css">
    <title>Resultat</title>
</head>

<body>
    
<h1>Deliberation</h1>




<?php
if(isset($_GET['deliberation'])){
    $page=$_GET['deliberation'];
     
            include('code_table/resultat/'.$page.'.php');
             
        

        }



?>
</body>

</html>