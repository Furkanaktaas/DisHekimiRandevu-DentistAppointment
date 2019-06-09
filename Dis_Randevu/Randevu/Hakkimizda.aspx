<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Hakkimizda.aspx.cs" Inherits="WebProjeTemplate.Hakkimizda" %>

<!Doctype html>
<html lang="en">
  <head runat="server">
    <title>Colorlib Medi+</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300, 400, 700" rel="stylesheet">

    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    <link rel="stylesheet" href="fonts/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="fonts/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
    <!-- Theme Style -->
    <link rel="stylesheet" href="css/style.css">
  </head>

  <body>
  <form id="form5" runat="server">    
    <!-- HEADER  Menüler iconlar giriş yap kayıt ol butonları var-->
    <header role="banner">
      <div class="top-bar">
        <div class="container">
          <div class="row">
            <div class="col-md-6 col-sm-6 col-5">
              <ul class="social list-unstyled">
                <li><a href="#"><span class="fa fa-facebook"></span></a></li>
                <li><a href="#"><span class="fa fa-twitter"></span></a></li>
                <li><a href="#"><span class="fa fa-instagram"></span></a></li>
              </ul>
            </div>
            <div class="col-md-6 col-sm-6 col-7 text-right">
                <a href="GirisYap.aspx" class="cta-btn" >Online Randevu Al</a>
            </div>
          </div>
        </div>
      </div>
      <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
          <a class="navbar-brand" href="index.aspx">Ordulu Diş Merkezi<span>+</span>  </a>
          

          <div class="collapse navbar-collapse" id="navbarsExample05">
            <ul class="navbar-nav ml-auto">
              <li class="nav-item">
                <a class="nav-link" href="index.aspx">Anasayfa</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" href="Hakkimizda.aspx">Hakkımızda</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="Iletisim.aspx">İletişim</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </header>
    <!-- END header -->
    <!-- burası içerik -->
      <section class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-6 element-animate">
            <img src="img/img_1.jpg" class="img-fluid mb-4" alt="Image placeholder">
          </div>
          <div class="col-md-1"></div>
          <div class="col-md-5 element-animate">
            <h2 class="text-uppercase mb-4">Hakkimizda</h2>
            <p class="lead">Ordulu Dis Merkezi olarak 1995 yılından itibaren hastalarımıza hizmet vermekteyiz.23 yıllık tecbürüyle diş hastalıkları tedavisinde ilk sıralara gelmeyi başarmış bulunmaktayız</p>
            <p class="mb-5">Ordulu Dis Merkezi olarak 1995 yılından itibaren hastalarımıza hizmet vermekteyiz.23 yıllık tecbürüyle diş hastalıkları tedavisinde ilk sıralara gelmeyi başarmış bulunmaktayız.</p>
            
          </div>
        </div>
      </div>
    </section>
    <!-- burası içerik son -->
      <!-- Footer -->
    <footer class="site-footer" role="contentinfo">
      <div class="container">
        <div class="row pt-md-3 element-animate">
          <div class="col-md-12">
            <hr class="border-t">
          </div>
          <div class="col-md-6 col-sm-12 copyright">
            <p>&copy; 2018 Ordu Şirketine aittir. </p>
          </div>
          <div class="col-md-6 col-sm-12 text-md-right text-sm-left">
            <a href="#" class="p-2"><span class="fa fa-facebook"></span></a>
            <a href="#" class="p-2"><span class="fa fa-twitter"></span></a>
            <a href="#" class="p-2"><span class="fa fa-instagram"></span></a>
          </div>
        </div>
      </div>
    </footer>
    <!-- END footer -->


    
  
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/bootstrap-datepicker.js"></script>
    <script src="js/jquery.timepicker.min.js"></script>
    <script src="js/jquery.waypoints.min.js"></script>
    <script src="js/main.js"></script>
   </form>       
  </body>
</html>
