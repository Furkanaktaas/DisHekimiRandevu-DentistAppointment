<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UyeOl.aspx.cs" Inherits="WebProjeTemplate.UyeOl" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Üye Ol</title>
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
  <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
           <!-- Üye Ol Paneli Kısmı -->
      <div class="modal-dialog" >
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="modalAppointmentLabel">Üye Ol</h5>
          </div>
          <div class="modal-body">
       <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
              <div class="form-group">
                  <asp:Label ID="Label1" runat="server" Text="TC No*" CssClass="text-black"></asp:Label>                  
              <asp:TextBox ID="TcNo" runat="server" MaxLength="11"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="TcNo" ForeColor="Red" Display="Dynamic" ValidationGroup="bosGecilemez"></asp:RequiredFieldValidator>
                 
                  <asp:ValidationSummary ID="ValidationSummary2" runat="server" />
              </div>
              <div class="form-group">
                  <asp:Label ID="Label2" runat="server" Text="Ad*" CssClass="text-black"></asp:Label>                
                  <asp:TextBox ID="Ad" runat="server" CssClass="form-control" MaxLength="20"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="Ad" ForeColor="Red" Display="Dynamic" ValidationGroup="bosGecilemez"></asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Ad kısmı sadece harflerden oluşabilir" ControlToValidate="Ad" ValidationExpression="^[A-z^şŞıİçÇöÖüÜĞğ\s]+$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="En az 3 karakter giriniz." ControlToValidate="Ad" ValidationExpression=".{3}.*" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                  <asp:ValidationSummary ID="ValidationSummary3" runat="server" />
              </div>
              <div class="form-group">
                  <asp:Label ID="Label3" runat="server" Text="Soyad*" CssClass="text-black"></asp:Label>                  
                  <asp:TextBox ID="Soyad" runat="server" CssClass="form-control" MaxLength="20"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="Soyad" ForeColor="Red" Display="Dynamic" ValidationGroup="bosGecilemez"></asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Soyad kısmı sadece harflerden oluşabilir" ControlToValidate="Soyad" ValidationExpression="^[A-z^şŞıİçÇöÖüÜĞğ\s]+$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="En az 2 karakter giriniz." ControlToValidate="Soyad" ValidationExpression=".{2}.*" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                  <asp:ValidationSummary ID="ValidationSummary4" runat="server" />
              </div>
              <div class="form-group">
                  <asp:Label ID="Label4" runat="server" Text="Adres*" CssClass="text-black"></asp:Label>
                  <asp:TextBox ID="Adres" runat="server" CssClass="form-control"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="Adres" ForeColor="Red" Display="Static" ValidationGroup="bosGecilemez"></asp:RequiredFieldValidator>
              </div>
              <div class="form-group">
                  <asp:Label ID="Label5" runat="server" Text="Cinsiyet*" CssClass="text-black"></asp:Label>
                  <asp:RadioButtonList ID="CinsiyetRb" runat="server" AutoPostBack="False"></asp:RadioButtonList>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="CinsiyetRb" ForeColor="Red" Display="Static" ValidationGroup="bosGecilemez"></asp:RequiredFieldValidator>
              </div>
              <div class="form-group">
                  <asp:Label ID="Label6" runat="server" Text="Telefon*" CssClass="text-black"></asp:Label>
                  <asp:TextBox ID="Telefon" runat="server" CssClass="form-control" TextMode="Phone" MaxLength="11"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="Telefon" ForeColor="Red" Display="Dynamic" ValidationGroup="bosGecilemez"></asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Yanlış Telefon Numarası" ControlToValidate="Telefon" ValidationExpression="^[0]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                  <asp:ValidationSummary ID="ValidationSummary5" runat="server" />
              </div>
              <div class="form-group">
                  <asp:Label ID="Label7" runat="server" Text="Email*" CssClass="text-black"></asp:Label>
                  <asp:TextBox ID="Email" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="Email" ForeColor="Red" Display="Dynamic" ValidationGroup="bosGecilemez"></asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Yanlış Epoasta adresi" ControlToValidate="Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                  <asp:ValidationSummary ID="ValidationSummary6" runat="server" />
              </div>
              <div class="form-group">
                  <asp:Label ID="Label8" runat="server" Text="Doğum Tarihi*" CssClass="text-black"></asp:Label>
                  <br />
                      <asp:DropDownList ID="gun" runat="server" AutoPostBack="False"></asp:DropDownList>
                      <asp:DropDownList ID="ay" runat="server" AutoPostBack="False"></asp:DropDownList>
                      <asp:DropDownList ID="yil" runat="server" AutoPostBack="False"></asp:DropDownList>
              </div>
              <div class="form-group">
                  <asp:Label ID="Label9" runat="server" Text="Doğum Yeri*" CssClass="text-black"></asp:Label>
                  <asp:TextBox ID="DogumYeri" runat="server" CssClass="form-control" MaxLength="20"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="DogumYeri" ForeColor="Red" Display="Dynamic" ValidationGroup="bosGecilemez"></asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Doğum yeri kısmı sadece harflerden oluşabilir" ControlToValidate="DogumYeri" ValidationExpression="^[A-z^şŞıİçÇöÖüÜĞğ\s]+$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                  <asp:ValidationSummary ID="ValidationSummary7" runat="server" />
              </div>
              <div class="form-group">
                  <asp:Label ID="Label10" runat="server" Text="Kan Grubu*" CssClass="text-black"></asp:Label>
                  <br />
                  <asp:DropDownList ID="KanGrubu" runat="server" AutoPostBack="False"></asp:DropDownList>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="KanGrubu" ForeColor="Red" Display="Static" ValidationGroup="bosGecilemez"></asp:RequiredFieldValidator>
              </div>
              <div class="form-group">
                  <asp:Label ID="Label11" runat="server" Text="Şifre*" CssClass="text-black"></asp:Label>
                  <asp:TextBox ID="Sifre" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="Sifre" ForeColor="Red" Display="Static" ValidationGroup="bosGecilemez"></asp:RequiredFieldValidator>
              </div>
              <div class="form-group">
                  <asp:Label ID="Label12" runat="server" Text="* Alanların doldurulması zorunludur."></asp:Label>
              </div>
               <div class="form-group">
                  <asp:Button ID="KayitBtn" OnClick="KayitBtn_Click"  runat="server" Text="Kayıt Ol" CssClass="btn btn-primary" ValidationGroup="bosGecilemez" />
              </div>
              <div class="form-group">
                  <asp:Label ID="Uyari" runat="server"></asp:Label>
              </div>
              </ContentTemplate></asp:UpdatePanel>
          </div>
        </div>
    </div>
   <!--  Üye Ol Paneli Kısmı Son -->
     

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

