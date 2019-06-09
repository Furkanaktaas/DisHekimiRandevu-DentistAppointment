<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Iletisim.aspx.cs" Inherits="WebProjeTemplate.Iletisim" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>İletişim</title>
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
                <a class="nav-link" href="Hakkimizda.aspx">Hakkımızda</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" href="Iletisim.aspx">İletişim</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </header>
    <!-- END header -->
     <hr class="border-t">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
           <!-- İletişim Paneli Kısmı -->
    <section class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-6 mb-5 element-animate">
            
              <div class="row">
                <div class="col-md-6 form-group">
                  <asp:Label ID="Label1" runat="server" Text="Ad"></asp:Label>                  
                  <asp:TextBox ID="ad" runat="server" CssClass="form-control form-control-lg"> </asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="ad" ForeColor="Red" Display="Dynamic" ValidationGroup="iletisimGrup"></asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Ad kısmı sadece harflerden oluşabilir" ControlToValidate="ad" ValidationExpression="^[A-z^şŞıİçÇöÖüÜĞğ\s]+$" ForeColor="Red" Display="Dynamic" ValidationGroup="iletisimGrup"></asp:RegularExpressionValidator>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="En az 3 karakter giriniz." ControlToValidate="ad" ValidationExpression=".{3}.*" ForeColor="Red" Display="Dynamic" ValidationGroup="iletisimGrup"></asp:RegularExpressionValidator>
                  <asp:ValidationSummary ID="ValidationSummary3" runat="server" ValidationGroup="iletisimGrup" />
                </div>
                <div class="col-md-6 form-group">
                  <asp:Label ID="Label2" runat="server" Text="Soyad"></asp:Label>                 
                  <asp:TextBox ID="soyad" runat="server" CssClass="form-control form-control-lg"> </asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="soyad" ForeColor="Red" Display="Dynamic" ValidationGroup="iletisimGrup"></asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Soyad kısmı sadece harflerden oluşabilir" ControlToValidate="soyad" ValidationExpression="^[A-z^şŞıİçÇöÖüÜĞğ\s]+$" ForeColor="Red" Display="Dynamic" ValidationGroup="iletisimGrup"></asp:RegularExpressionValidator>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="En az 2 karakter giriniz." ControlToValidate="soyad" ValidationExpression=".{2}.*" ForeColor="Red" Display="Dynamic" ValidationGroup="iletisimGrup"></asp:RegularExpressionValidator>
                  <asp:ValidationSummary ID="ValidationSummary4" runat="server" ValidationGroup="iletisimGrup" />
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 form-group">
                  <asp:Label ID="Label3" runat="server" Text="Email"></asp:Label>                   
                  <asp:TextBox ID="email" runat="server" CssClass="form-control form-control-lg" TextMode="Email"> </asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="email" ForeColor="Red" Display="Dynamic" ValidationGroup="iletisimGrup"></asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Yanlış Epoasta adresi" ControlToValidate="email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red" Display="Dynamic" ValidationGroup="iletisimGrup"></asp:RegularExpressionValidator>
                  <asp:ValidationSummary ID="ValidationSummary6" runat="server" ValidationGroup="iletisimGrup" />
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 form-group">
                  <asp:Label ID="Label4" runat="server" Text="Mesajınızı Belirtiniz"></asp:Label>                  
                  <asp:TextBox ID="mesaj" runat="server" CssClass="form-control form-control-lg" Height="150px" TextMode="MultiLine"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="mesaj" ForeColor="Red" Display="Static" ValidationGroup="iletisimGrup"></asp:RequiredFieldValidator>
                </div>
              </div>
              <div class="row">
                <div class="col-md-6 form-group">
                  <asp:Button ID="gonderbtn" runat="server" Text="Gönder" ValidationGroup="iletisimGrup" CssClass="btn btn-primary btn-lg btn-block" OnClick="gonderbtn_Click"/>
                  <asp:Label ID="uyari" runat="server"></asp:Label> 
                </div>
              </div>
            
          </div>
          <div class="col-md-1"></div>
          <div class="col-md-5 element-animate">
            
            <h5 class="text-uppercase mb-3">Address</h5>
            <p class="mb-5">98 West 21th Street, <br> Suite 721 <br> New York NY 10016</p>
            
            <h5 class="text-uppercase mb-3">Email Us At</h5>
            <p class="mb-5"><a href="mailto:info@yourdomain.com">info@yourdomain.com</a> <br> <a href="mailto:customer@yourdomain.com">customer@yourdomain.com</a></p>
            
            <h5 class="text-uppercase mb-3">Call Us</h5>
            <p class="mb-5">Phone: (+1) 435 3533 <br> Mobile: (+1) 435 3533 <br> Fax: (+1) 435 3534</p>
  

          </div>
        </div>
      </div>
    </section>
   <!--  İletişim Paneli Kısmı Son -->
     
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
