<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoktorPanel.aspx.cs" Inherits="WebProjeTemplate.DoktorPanel" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Doktor Paneli</title>
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
                <asp:Button ID="CikisBtn" OnClick="CikisBtn_Click"  runat="server" Text="Çıkış Yap" CssClass="btn btn-primary" />
            </div>
          </div>
        </div>
      </div>

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container">
                    <a class="navbar-brand" href="#"><asp:Label ID="unvan" runat="server"></asp:Label> Panel<span>+</span></a><asp:Label ID="kullaniciAdiLbl" runat="server" ></asp:Label>
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
  <!-- Tasarım yapılacak Kısım--------------------------------------------------------------------------------- -->
    <section class="section bg-light custom-tabs">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 border-right element-animate" data-animate-effect="fadeInLeft">
                        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                            <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true"><span>01</span> Aktif Randevular</a>
                            <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false"><span>02</span> Randevu Geçmişi</a>
                            <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false"><span>03</span> Bilgileri Güncelle</a>
                            <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false"><span>04</span> Kullanıcı Adı ve Şifre Değiştir</a>
                        </div>
                    </div>
                    <div class="col-md-1"></div>

                    <div class="col-md-7 element-animate" data-animate-effect="fadeInLeft">
                        <div class="tab-content" id="v-pills-tabContent">
                            <!-- Aktif Randevular kısmı --------------------------------------------------------------- -->
                            <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                    <ContentTemplate>
                                  <h3>Aktif Randevular</h3><asp:Label ID="disciId" runat="server" Visible="False"></asp:Label>
                                <asp:GridView ID="GridView1" runat="server"></asp:GridView>
                                   </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <!-- Aktif Randevular kısmı son --------------------------------------------------------------- -->
                            <!-- Geçmiş Randevular Kısmı -------------------------------------------------------------- -->
                            <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                    <ContentTemplate>
                                  <h3>Randevu Geçmişi</h3>
                                <asp:GridView ID="GridView2" runat="server"></asp:GridView>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <!-- Geçmiş Randevular Kısmı son -------------------------------------------------------------- -->
                            <!-- Bilgileri Güncelle kısmı ----------------------------------------------- -->
                            <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
                                <asp:Panel ID="duzenlePanel" runat="server" Visible="True">
                                            <table>
                                                <tr>
                                                    <td>Ad:</td>
                                                    <td>
                                                        <div class="form-group">
                                                            <asp:TextBox ID="Ad" runat="server" CssClass="form-control" MaxLength="20"></asp:TextBox></div>
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="Ad" ForeColor="Red" Display="Dynamic" ValidationGroup="GuncelleGrup"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Ad kısmı sadece harflerden oluşabilir" ControlToValidate="Ad" ValidationExpression="^[A-z^şŞıİçÇöÖüÜĞğ\s]+$" ForeColor="Red" Display="Dynamic" ValidationGroup="GuncelleGrup"></asp:RegularExpressionValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="En az 3 karakter giriniz." ControlToValidate="Ad" ValidationExpression=".{3}.*" ForeColor="Red" Display="Dynamic" ValidationGroup="GuncelleGrup"></asp:RegularExpressionValidator>
                                                        <asp:ValidationSummary ID="ValidationSummary1S" runat="server" ValidationGroup="GuncelleGrup" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Soyad:</td>
                                                    <td>
                                                        <asp:TextBox ID="Soyad" runat="server" CssClass="form-control" MaxLength="20"></asp:TextBox></td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="Soyad" ForeColor="Red" Display="Dynamic" ValidationGroup="GuncelleGrup"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Soyad kısmı sadece harflerden oluşabilir" ControlToValidate="Soyad" ValidationExpression="^[A-z^şŞıİçÇöÖüÜĞğ\s]+$" ForeColor="Red" Display="Dynamic" ValidationGroup="GuncelleGrup"></asp:RegularExpressionValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="En az 2 karakter giriniz." ControlToValidate="Soyad" ValidationExpression=".{2}.*" ForeColor="Red" Display="Dynamic" ValidationGroup="GuncelleGrup"></asp:RegularExpressionValidator>
                                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="GuncelleGrup" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Adres:</td>
                                                    <td>
                                                        <asp:TextBox ID="Adres" runat="server" CssClass="form-control"></asp:TextBox></td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="Adres" ForeColor="Red" ValidationGroup="GuncelleGrup"></asp:RequiredFieldValidator></td>
                                                </tr>
                                                <tr>
                                                    <td>Cinsiyet:</td>
                                                    <td>
                                                        <asp:RadioButtonList ID="CinsiyetRb" runat="server" AutoPostBack="False"></asp:RadioButtonList></td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="CinsiyetRb" ForeColor="Red" ValidationGroup="GuncelleGrup"></asp:RequiredFieldValidator></td>
                                                </tr>
                                                <tr>
                                                    <td>Telefon:</td>
                                                    <td>
                                                        <asp:TextBox ID="Telefon" runat="server" CssClass="form-control" TextMode="Phone" MaxLength="11"></asp:TextBox></td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="Telefon" ForeColor="Red" Display="Dynamic" ValidationGroup="GuncelleGrup"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Yanlış Telefon Numarası" ControlToValidate="Telefon" ValidationExpression="^[0]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$" ForeColor="Red" Display="Dynamic" ValidationGroup="GuncelleGrup"></asp:RegularExpressionValidator>
                                                        <asp:ValidationSummary ID="ValidationSummary3" runat="server" ValidationGroup="GuncelleGrup" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Email:</td>
                                                    <td>
                                                        <asp:TextBox ID="Email" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox></td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="Email" ForeColor="Red" Display="Dynamic" ValidationGroup="GuncelleGrup"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Yanlış Epoasta adresi" ControlToValidate="Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red" Display="Dynamic" ValidationGroup="GuncelleGrup"></asp:RegularExpressionValidator>
                                                        <asp:ValidationSummary ID="ValidationSummary4" runat="server" ValidationGroup="GuncelleGrup" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Doğum Tarihi:</td>
                                                    <td>
                                                        <asp:DropDownList ID="gun" runat="server" AutoPostBack="False"></asp:DropDownList>
                                                        <asp:DropDownList ID="ay" runat="server" AutoPostBack="False"></asp:DropDownList>
                                                        <asp:DropDownList ID="yil" runat="server" AutoPostBack="False"></asp:DropDownList></td>
                                                </tr>
                                                <tr>
                                                    <td>Doğum Yeri:</td>
                                                    <td>
                                                        <asp:TextBox ID="DogumYeri" runat="server" CssClass="form-control" MaxLength="20"></asp:TextBox></td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="DogumYeri" ForeColor="Red" Display="Dynamic" ValidationGroup="GuncelleGrup"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Doğum yeri kısmı sadece harflerden oluşabilir" ControlToValidate="DogumYeri" ValidationExpression="^[A-z^şŞıİçÇöÖüÜĞğ\s]+$" ForeColor="Red" Display="Dynamic" ValidationGroup="GuncelleGrup"></asp:RegularExpressionValidator>
                                                        <asp:ValidationSummary ID="ValidationSummary5" runat="server" ValidationGroup="GuncelleGrup" />
                                                    </td>
                                                </tr>                                             
                                                <tr>
                                                    <td>
                                                        <asp:Button ID="Guncelle" runat="server" Text="Güncelle" CssClass="btn btn-primary" OnClick="Guncelle_Click" ValidationGroup="GuncelleGrup" /></td>
                                                </tr>
                                            </table>
                                    <asp:Label ID="uyari" runat="server"></asp:Label>
                                        </asp:Panel>
                                    </ContentTemplate></asp:UpdatePanel>
                            </div>
                            <!-- Bilgileri Güncelle kısmı son----------------------------------------------- -->
                            <!-- Şifre Değiştir kısmı ----------------------------------------------- -->
                            <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server"><ContentTemplate>
                                  <h3>Kullanıcı Adı Değiştir</h3>
                                    <div class="form-group">
                                            <asp:Label ID="Label1" runat="server" Text="Kullanıcı Adını Giriniz:" CssClass="text-black"></asp:Label>
                                            <asp:TextBox ID="kulAdıDüzenle" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="kulAdıDüzenle" ForeColor="Red" Display="Static" ValidationGroup="kulAdıDüzenleGrup"></asp:RequiredFieldValidator>
                                        </div>
                                      <div class="form-group">
                                            <asp:Button ID="kulAdıDegistirBtn" runat="server" Text="Değiştir" CssClass="btn btn-primary" OnClick="kulAdıDegistirBtn_Click" ValidationGroup="kulAdıDüzenleGrup" /><br />
                                            <asp:Label ID="uyariKuladiDegistirLbl" runat="server"></asp:Label>
                                        </div>
                                  <h3>Şifre Değiştir</h3>
                                <div class="form-group">
                                            <asp:Label ID="Label6" runat="server" Text="Şuanki Şifrenizi Giriniz:" CssClass="text-black"></asp:Label>
                                            <asp:TextBox ID="eskiSifre" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="eskiSifre" ForeColor="Red" Display="Static" ValidationGroup="SifreGuncelle"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="Label10" runat="server" Text="Yeni Şifre:" CssClass="text-black"></asp:Label>
                                            <asp:TextBox ID="yeniSifre" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="yeniSifre" ForeColor="Red" Display="Static" ValidationGroup="SifreGuncelle"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="Label12" runat="server" Text="Yeni Şifre Tekrar:" CssClass="text-black"></asp:Label>
                                            <asp:TextBox ID="yeniSifre2" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="yeniSifre2" ForeColor="Red" Display="Dynamic" ValidationGroup="SifreGuncelle"></asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Şifreler Aynı Değil" ControlToCompare="yeniSifre" ControlToValidate="yeniSifre2" Display="Dynamic" ForeColor="Red" ValidationGroup="SifreGuncelle"></asp:CompareValidator>
                                            <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="SifreGuncelle" />
                                        </div>
                                        <div class="form-group">
                                            <asp:Button ID="sifreDegistirBtn" runat="server" Text="Değiştir" CssClass="btn btn-primary" OnClick="sifreDegistirBtn_Click" ValidationGroup="SifreGuncelle" /><br />
                                            <asp:Label ID="uyari2" runat="server"></asp:Label>
                                        </div>
                                </ContentTemplate></asp:UpdatePanel> 
                            </div>
                            <!-- Şifre Değiştir kısmı son ----------------------------------------------- -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
     
 <!-- Tasarım yapılacak Kısım---------------------------------------------------------------- -->
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

