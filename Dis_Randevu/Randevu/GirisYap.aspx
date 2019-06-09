<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GirisYap.aspx.cs" Inherits="WebProjeTemplate.GirisYap" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Giriş Yap</title>
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
    <form id="form1" runat="server">
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
                <a class="nav-link" href="Hakkimizda.aspx">Hakkımızda</a>
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
     <hr class="border-t">
  
           <!-- Giriş Yap Paneli Kısmı -->
      <div class="modal-dialog" >
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="modalAppointmentLabel">Giriş Yap</h5>
          </div>
          <div class="modal-body">
       
              <div class="form-group">
                  <asp:Label ID="Label1" runat="server" Text="TC No" CssClass="text-black"></asp:Label>
                  <asp:TextBox ID="TcNo" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="TcNo" ForeColor="Red"></asp:RequiredFieldValidator>
<asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Eksik Tc No" MinimumValue="10000000000" MaximumValue="99999999999" Type="Double" ControlToValidate="TcNo" ForeColor="Red"></asp:RangeValidator>
              </div>
              <div class="form-group">
                  <asp:Label ID="Label2" runat="server" Text="Şifre" CssClass="text-black"></asp:Label>
                  <asp:TextBox ID="Sifre" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="Sifre" ForeColor="Red"></asp:RequiredFieldValidator>
              </div>
              <div class="form-group">
                  <asp:Button ID="GirisBtn" OnClick="GirisBtn_Click"  runat="server" Text="Giriş Yap" CssClass="btn btn-primary" />
              </div>
              <div class="form-group">
                  <asp:Label ID="Uyari" runat="server"></asp:Label>
              </div>
              <div class="form-group">
                   <a href="#" >Şifremi Unuttum</a>
              </div>
               <div class="form-group">
                  <asp:Label ID="Yazi" runat="server" text="Eğer üye değilseniz buraya tıklayarak "></asp:Label>
                   <a href="UyeOl.aspx">Üye Olunuz</a>
              </div>
          </div>
        </div>
    </div>
   <!--  Giriş Yap Paneli Kısmı Son -->
     

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
