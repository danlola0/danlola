<?php
session_start();

try{

    $bd=new PDO('mysql:host=localhost;dbname=deliberation','root','');
    
    }catch(ExceptionPDO $e){
    
    echo 'erreur' .$e;
    
    }
    


if(isset($_POST['envoyez'])){
if(isset($_POST['nom']) and isset($_POST['gmail']) and isset($_POST['message']) ){

$sql=$bd->prepare('INSERT INTO message values(null,:nom ,:gmail ,:message)');
$sql->bindValue(':nom',$_POST['nom']);
$sql->bindValue(':gmail',$_POST['gmail']);
$sql->bindValue(':message',$_POST['message']);
$recerv=$sql->execute();



}

}

if(isset($_POST['connecte'])){

    if(!empty($_POST['nom']) || !empty($_POST['password'])){
     
   $code=('SELECT nom ,password from admin where nom=:nom and password=:password');
   $rec=$bd->prepare($code);
   $rec->execute(array('nom'=>$_POST['nom'] , 'password'=>$_POST['password'] ));
   $count=$rec->rowCount();

  if($count >0){
         
  $_SESSION['nom']= $_POST['nom'];
  header('location:menu.php');

  }else{
   header('location:index.php');


  }

  }





    }














?>






<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="">
    <meta name="author" content="">

    <title>FACULTE DES SCIENCES</title>

    <!-- CSS FILES -->
    <link rel="preconnect" href="https://fonts.googleapis.com">

    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,wght@0,400;0,500;0,700;1,400&display=swap"
        rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <link href="css/bootstrap-icons.css" rel="stylesheet">

    <link href="css/templatemo-tiya-golf-club.css" rel="stylesheet">


</head>

<body>

    <main>

        <nav class="navbar navbar-expand-lg">
            <div class="container">
                <a class="navbar-brand d-flex align-items-center" href="index.html">
                    <img src="images/Université_de_Kinshasa_-_Blason.svg.png" class="navbar-brand-image img-fluid"
                        alt="Tiya Golf Club">
                    <span class="navbar-brand-text">

                        <small>Unikin</small>
                    </span>
                </a>

                <div class="d-lg-none ms-auto me-3">
                    <a class="btn custom-btn custom-border-btn" data-bs-toggle="offcanvas" href="#offcanvasExample"
                        role="button" aria-controls="offcanvasExample">Member Login</a>
                </div>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-lg-auto">
                        <li class="nav-item">
                            <a class="nav-link click-scroll" href="#section_1">Accueil</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link click-scroll" href="#section_4">event</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link click-scroll" href="#section_3">Nous contacter</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link click-scroll" href="#section_2">A propos</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link click-scroll" href="ajout.php">Espace étudiant</a>
                        </li>


                    </ul>

                    <div class="d-none d-lg-block ms-lg-3">
                        <a class="btn custom-btn custom-border-btn" data-bs-toggle="offcanvas" href="#offcanvasExample"
                            role="button" aria-controls="offcanvasExample">Espace Admnistrateur</a>
                    </div>
                </div>
            </div>
        </nav>

        <div class="offcanvas offcanvas-end" data-bs-scroll="true" tabindex="-1" id="offcanvasExample"
            aria-labelledby="offcanvasExampleLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasExampleLabel">Se connecter</h5>

                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>

            <div class="offcanvas-body d-flex flex-column">
                <form class="custom-form member-login-form" action="" method="post">

                    <div class="member-login-form-body">
                        <div class="mb-4">
                            <label class="form-label mb-2">Entrer votre nom</label>

                            <input type="text" name="nom" id="login" autocomplete="off" class="form-control"
                                placeholder="yongo lola" required>
                        </div>

                        <div class="mb-4">
                            <label class="form-label mb-2" for="member-login-password">Mot de passe</label>

                            <input type="password" name="password" autocomplete="off" id="pwd" class="form-control"
                                placeholder="saisissez le mot de passe" required="">
                        </div>

                        <div class="form-check mb-4">
                            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">

                            <label class="form-check-label" for="flexCheckDefault">
                                Se rappeler de moi
                            </label>
                        </div>

                        <div class="col-lg-5 col-md-7 col-8 mx-auto">
                            <button type="submit" name="connecte" class="form-control">connecter</button>
                        </div>


                    </div>
                </form>

                <div class="mt-auto mb-5">
                    <p>
                        <strong class="text-white me-3"> <a href="page_demande_pwd.php">Mot de passe
                                oublié?</a></strong>


                    </p>
                </div>
            </div>

            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320">
                <path fill="#3D405B" fill-opacity="1"
                    d="M0,224L34.3,192C68.6,160,137,96,206,90.7C274.3,85,343,139,411,144C480,149,549,107,617,122.7C685.7,139,754,213,823,240C891.4,267,960,245,1029,224C1097.1,203,1166,181,1234,160C1302.9,139,1371,117,1406,106.7L1440,96L1440,320L1405.7,320C1371.4,320,1303,320,1234,320C1165.7,320,1097,320,1029,320C960,320,891,320,823,320C754.3,320,686,320,617,320C548.6,320,480,320,411,320C342.9,320,274,320,206,320C137.1,320,69,320,34,320L0,320Z">
                </path>
            </svg>
        </div>


        <section class="hero-section d-flex justify-content-center align-items-center" id="section_1">

            <div class="section-overlay"></div>

            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320">
                <path fill="#3D405B" fill-opacity="1"
                    d="M0,224L34.3,192C68.6,160,137,96,206,90.7C274.3,85,343,139,411,144C480,149,549,107,617,122.7C685.7,139,754,213,823,240C891.4,267,960,245,1029,224C1097.1,203,1166,181,1234,160C1302.9,139,1371,117,1406,106.7L1440,96L1440,0L1405.7,0C1371.4,0,1303,0,1234,0C1165.7,0,1097,0,1029,0C960,0,891,0,823,0C754.3,0,686,0,617,0C548.6,0,480,0,411,0C342.9,0,274,0,206,0C137.1,0,69,0,34,0L0,0Z">
                </path>
            </svg>

            <div class="container">
                <div class="row">

                    <div class="col-lg-6 col-12 mb-5 mb-lg-0">
                        <h2 class="text-white">SOYEZ LES BIENVENUS(ES) </h2>

                        <h1 class="cd-headline rotate-1 text-white mb-4 pb-2">
                            <span>A LA FACULTE</span>
                            <span class="cd-words-wrapper">
                                <b class="is-visible">DES SCIENCES</b>
                                <b>Digitalisons</b>
                                <b>Notre université</b>
                            </span>
                        </h1>

                        <div class="custom-btn-group">
                            <a href="#section_2" class="btn custom-btn smoothscroll me-3">Savoir plus </a>

                            <a href="#section_3" class="link smoothscroll"> veuillez nous laisser vos suggestions &
                                messages</a>
                        </div>
                    </div>

                    <div class="col-lg-6 col-12">
                        <div class="ratio ratio-16x9">

                        </div>
                    </div>

                </div>
            </div>

            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320">
                <path fill="#ffffff" fill-opacity="1"
                    d="M0,224L34.3,192C68.6,160,137,96,206,90.7C274.3,85,343,139,411,144C480,149,549,107,617,122.7C685.7,139,754,213,823,240C891.4,267,960,245,1029,224C1097.1,203,1166,181,1234,160C1302.9,139,1371,117,1406,106.7L1440,96L1440,320L1405.7,320C1371.4,320,1303,320,1234,320C1165.7,320,1097,320,1029,320C960,320,891,320,823,320C754.3,320,686,320,617,320C548.6,320,480,320,411,320C342.9,320,274,320,206,320C137.1,320,69,320,34,320L0,320Z">
                </path>
            </svg>
        </section>


        <section class="about-section section-padding" id="section_2">
            <div class="container">
                <div class="row">

                    <div class="col-lg-12 col-12 text-center">
                        <h2 class="mb-lg-5 mb-4">Développeur danlola</h2>
                    </div>

                    <div class="col-lg-5 col-12 me-auto mb-4 mb-lg-0">
                        <h3 class="mb-3">Gestion de la déliberation </h3>

                        <p> Meilleur gestion du parcours des étudiants par le canal de YONGO LOLA Daniel,la traçabilité
                            du parcours de l'étudiant au sein de la faculté de science est devenue plus simple</p>

                        <p></p>
                    </div>

                    <div class="col-lg-3 col-md-6 col-12 mb-4 mb-lg-0 mb-md-0">
                        <div class="member-block">
                            <div class="member-block-image-wrap">
                                <img src="images/IMG_5112.jpeg" class="member-block-image img-fluid" alt="">


                                <ul class="social-icon">
                                    <li class="social-icon-item">
                                        <a href="#" class="social-icon-link bi-twitter"></a>
                                    </li>

                                    <li class="social-icon-item">
                                        <a href="#" class="social-icon-link bi-whatsapp"></a>
                                    </li>
                                </ul>
                            </div>

                            <div class="member-block-info d-flex align-items-center">
                                <h4>Dev. danlola</h4>


                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-12">
                        <div class="member-block">
                            <div class="member-block-image-wrap">



                            </div>


                        </div>
                    </div>
                </div>

            </div>
            </div>
        </section>




        <section class="membership-section section-padding" id="section_3">
            <div class="container">
                <div class="row">

                    <div class="col-lg-12 col-12 text-center mx-auto mb-lg-5 mb-4">
                        <h2><span>Laissez-nous vos messages</span></h2>
                    </div>

                    <div class="col-lg-6 col-12 mb-3 mb-lg-0">


                    </div>
                </div>

                <div class="col-lg-5 col-12 mx-auto">

                    <form action="" method="post" class="custom-form membership-form shadow-lg" role="form">
                        <h4 class="text-white mb-4">Remplissez-Cette fiche</h4>

                        <div class="form-floating">
                            <input type="text" name="nom" id="full-name" class="form-control" placeholder="Nom complet"
                                required="">

                            <label for="floatingInput">Votre nom complet</label>
                        </div>

                        <div class="form-floating">
                            <input type="email" name="gmail" id="email" pattern="[^ @]*@[^ @]*" class="form-control"
                                placeholder="Email address" required="">

                            <label for="floatingInput">votre Gmail</label>
                        </div>

                        <div class="form-floating">
                            <textarea class="form-control" id="message" name="message"
                                placeholder="Describe message here"></textarea>

                            <label for="floatingTextarea">votre Message</label>
                        </div>

                        <button type="submit" name="envoyez" class="form-control">Envoyez</button>
                </div>
                </form>
            </div>

            </div>
            </div>
        </section>


        <section class="events-section section-bg section-padding" id="section_4">
            <div class="container">
                <div class="row">

                    <div class="col-lg-12 col-12">
                        <h2 class="mb-lg-3">Départements de la faculté</h2>
                    </div>

                    <div class="row custom-block mb-3">
                        <div class="col-lg-2 col-md-4 col-12 order-2 order-md-0 order-lg-0">
                            <div
                                class="custom-block-date-wrap d-flex d-lg-block d-md-block align-items-center mt-3 mt-lg-0 mt-md-0">
                                <h6 class="custom-block-date mb-lg-1 mb-0 me-3 me-lg-0 me-md-0"></h6>


                            </div>
                        </div>

                        <div class="col-lg-4 col-md-8 col-12 order-1 order-lg-0">
                            <div class="custom-block-image-wrap">
                                <a href="event-detail.html">
                                    <img src="images/unikin-img91-10.jpg" class="custom-block-image img-fluid" alt="">

                                    <i class="custom-block-icon bi-link"></i>
                                </a>
                            </div>
                        </div>

                        <div class="col-lg-6 col-12 order-3 order-lg-0">
                            <div class="custom-block-info mt-2 mt-lg-0">
                                <a href="event-detail.html" class="events-title mb-3">la faculté des sciences compte six
                                    départements, à savoir :</a>

                                <p class="mb-0">biologie , Chimie et industrie,environnement,géosciences,mathématiques &
                                    informatique et physique.
                                    <br> ces six départements de recherche et d'enseignement organisent tous les
                                    diplomes de graduat ;licence ,DEA et doctorat . <br> En outre , la faculté organise
                                    une propédeutique physique-mathématique;une académie cisco pour la formation
                                    professionnelle des techniciens des réseaux informatiques et une école doctoral
                                    CFDMI à vocation internationale. </p>

                                <div class="d-flex flex-wrap border-top mt-4 pt-3">

                                    <div class="mb-4 mb-lg-0">
                                        <div class="d-flex flex-wrap align-items-center mb-1">


                                        </div>

                                        <div class="d-flex flex-wrap align-items-center">



                                        </div>
                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row custom-block custom-block-bg">
                        <div class="col-lg-2 col-md-4 col-12 order-2 order-md-0 order-lg-0">
                            <div
                                class="custom-block-date-wrap d-flex d-lg-block d-md-block align-items-center mt-3 mt-lg-0 mt-md-0">
                                <h6 class="custom-block-date mb-lg-1 mb-0 me-3 me-lg-0 me-md-0">Dev</h6>

                                <strong class="text-white">danlola</strong>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-8 col-12 order-1 order-lg-0">
                            <div class="custom-block-image-wrap">
                                <a href="event-detail.html">
                                    <img src="images/batiment-unikin.jpg" class="custom-block-image img-fluid" alt="">

                                    <i class="custom-block-icon bi-link"></i>
                                </a>
                            </div>
                        </div>

                        <div class="col-lg-6 col-12 order-3 order-lg-0">
                            <div class="custom-block-info mt-2 mt-lg-0">
                                <a href="event-detail.html" class="events-title mb-3">Réduction des frais sur les
                                    impressions</a>

                                <p class="mb-0">un réel impact sur le plan écologique, nous réduisons les frais des
                                    impression sur papiers.
                                    Génération des palmares ,grilles de délibération ,procès verbaux,rélévés des
                                    cotes.... </p>

                                <div class="d-flex flex-wrap border-top mt-4 pt-3">

                                    <div class="mb-4 mb-lg-0">
                                        <div class="d-flex flex-wrap align-items-center mb-1">
                                            <span class="custom-block-span">Veuillez nous écrire:</span>

                                            <p class="mb-0">+243 992724685</p>
                                        </div>


                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>

            </div>
            </div>
        </section>


        <section class="contact-section section-padding">
            <div class="container">
                <div class="row">

                    <div class="col-lg-5 col-12">

                    </div>

                    <div class="col-lg-6 col-12">
                        <div class="contact-info mt-5">
                            <div class="contact-info-item">



                            </div>

                            <img src="images/downloadfile-1.jpg" class="img-fluid" alt="photo">
                        </div>
                    </div>

                </div>
            </div>
        </section>
    </main>

    <footer class="site-footer">
        <div class="container">
            <div class="row">

                <div class="col-lg-6 col-12 me-auto mb-5 mb-lg-0">
                    <a class="navbar-brand d-flex align-items-center" href="index.html">
                        <img src="images/Université_de_Kinshasa_-_Blason.svg.png" class="navbar-brand-image img-fluid"
                            alt="photo">


                        </span>
                    </a>
                </div>

                <div class="col-lg-3 col-12">
                    <h5 class="site-footer-title mb-4">Suivez-nous sur:</h5>



                    <br>
                    <p class="copyright-text">Copyright © 2023danlola</p>
                </div>

                <div class="col-lg-2 col-12 ms-auto">
                    <ul class="social-icon mt-lg-5 mt-3 mb-4">
                        <li class="social-icon-item">
                            <a href="#" class="social-icon-link bi-instagram"></a>
                        </li>

                        <li class="social-icon-item">
                            <a href="#" class="social-icon-link bi-twitter"></a>
                        </li>

                        <li class="social-icon-item">
                            <a href="#" class="social-icon-link bi-whatsapp"></a>
                        </li>
                    </ul>
                    <p class="copyright-text"><a rel="nofollow" href="https://templatemo.com" target="_blank"></a></p>

                </div>

            </div>
        </div>

        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320">
            <path fill="#81B29A" fill-opacity="1"
                d="M0,224L34.3,192C68.6,160,137,96,206,90.7C274.3,85,343,139,411,144C480,149,549,107,617,122.7C685.7,139,754,213,823,240C891.4,267,960,245,1029,224C1097.1,203,1166,181,1234,160C1302.9,139,1371,117,1406,106.7L1440,96L1440,320L1405.7,320C1371.4,320,1303,320,1234,320C1165.7,320,1097,320,1029,320C960,320,891,320,823,320C754.3,320,686,320,617,320C548.6,320,480,320,411,320C342.9,320,274,320,206,320C137.1,320,69,320,34,320L0,320Z">
            </path>
        </svg>
    </footer>


    <!-- JAVASCRIPT FILES -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/jquery.sticky.js"></script>
    <script src="js/click-scroll.js"></script>
    <script src="js/animated-headline.js"></script>
    <script src="js/modernizr.js"></script>
    <script src="js/custom.js"></script>

</body>

</html>