<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<h1>Creation reussie</h1>
<?php
session_start();
if(isset($_SESSION['nom'])){

 
    echo 'Votre compte est bel bien crée . <br> Si vous voulez retourné sur 
   le formulaire de connection clicker sur le lien ci-dessous <br> soyez le bienenu   '
    .$_SESSION['nom'];
   
}

?>



</body>
</html>



