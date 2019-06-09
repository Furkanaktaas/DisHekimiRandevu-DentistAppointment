<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HastaPanel.aspx.cs" Inherits="WebProjeTemplate.HastaPanel" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Hasta Panel</title>
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
                            <asp:Button ID="CikisBtn" OnClick="CikisBtn_Click" runat="server" Text="Çıkış Yap" CssClass="btn btn-primary" />
                        </div>
                    </div>
                </div>
            </div>

            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container">
                    <a class="navbar-brand" href="#">Hasta Panel<span>+</span></a><asp:Label ID="hastaAdSoyad" runat="server" ></asp:Label>

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
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <!-- Hasta Panel içerik -->

        <!-- -------------------------------------------------------------------------------- -->
        <section class="section bg-light custom-tabs">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 border-right element-animate" data-animate-effect="fadeInLeft">
                        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                            <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true"><span>01</span> Randevu Al</a>
                            <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false"><span>02</span> Randevu Geçmişi</a>
                            <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false"><span>03</span> Bilgileri Güncelle</a>
                            <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false"><span>04</span> Şifre Değiştir</a>
                        </div>
                    </div>

                    <div class="col-md-1"></div>
                    <div class="col-md-7 element-animate" data-animate-effect="fadeInLeft">
                        <div class="tab-content" id="v-pills-tabContent">
                            <!-- Randevu al kısmı --------------------------------------------------------------- -->
                            <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                    <ContentTemplate>
                                        <table>
                                            <tr style="text-align: center;">
                                                <td colspan="2"><span class="icon flaticon-hospital"></span></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label14" runat="server" Text="Label">İl:</asp:Label></td>
                                                <td>
                                                    <asp:DropDownList ID="il" Width="200" Height="30" runat="server" AutoPostBack="True" OnSelectedIndexChanged="il_SelectedIndexChanged" ValidationGroup="randevuGrup"></asp:DropDownList></td>
                                            </tr>

                                            <!--İL SONU-->
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label15" runat="server" Text="Label">İlce</asp:Label></td>
                                                <td>
                                                    <asp:DropDownList ID="ilce" Width="200" Height="30" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ilce_SelectedIndexChanged" ValidationGroup="randevuGrup">
                                                    </asp:DropDownList></td>
                                            </tr>
                                            <!--İLÇE SONU-->

                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label16" runat="server" Text="Label">Klinik</asp:Label></td>
                                                <td>
                                                    <asp:DropDownList Width="200" Height="30" ID="klinik" runat="server" AutoPostBack="true" OnSelectedIndexChanged="klinik_SelectedIndexChanged" ValidationGroup="randevuGrup"></asp:DropDownList></td>
                                            </tr>

                                            <!--KLİNİK SONU -->

                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label17" runat="server" Text="Label">Doktor:</asp:Label></td>
                                                <td>
                                                    <asp:DropDownList Width="200" Height="30" ID="doktor" runat="server" AutoPostBack="true" OnSelectedIndexChanged="doktor_SelectedIndexChanged"></asp:DropDownList></td>
                                            </tr>
                                            <!-- DOKTOR SONU -->

                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label19" runat="server" Text="Tarih"></asp:Label></td>
                                                <td>
                                                    <asp:Calendar ID="tarih" runat="server" OnDayRender="tarih_DayRender" OnSelectionChanged="tarih_SelectionChanged"></asp:Calendar>
                                                </td>
                                            </tr>

                                            <!-- TARİH SONU -->

                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label18" runat="server" Text="Label">Saat</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="saat" Width="200" Height="30" runat="server" ValidationGroup="randevuGrup"></asp:DropDownList>

                                                </td>

                                            </tr>

                                            <tr>
                                                <td></td>
                                                <td>
                                                    <asp:Button ID="Button1" runat="server" Text="RANDEVU AL" OnClick="Button1_Click" ValidationGroup="randevuGrup" /></td>
                                            </tr>

                                        </table>
                                        <asp:Label ID="basarili" runat="server"></asp:Label><br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ForeColor="Red" ControlToValidate="saat" runat="server" ErrorMessage="Boş Alan Bırakmayınız" ValidationGroup="randevuGrup"></asp:RequiredFieldValidator>
                                        <asp:Label ID="hastaId" runat="server" Visible="False"></asp:Label>

                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <!-- Randevu al kısmı son --------------------------------------------------------------- -->
                            <!-- Randevu Geçmişi Kısmı -------------------------------------------------------------- -->
                            <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                                <span class="icon flaticon-doctor"></span>
                                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                         <ContentTemplate>
                                             <asp:Label ID="Label21" runat="server" Text="AKTİF RANDEVULAR"></asp:Label>
                                             <asp:GridView ID="randevuGecmisiGrid2" runat="server"  AutoGenerateDeleteButton="True" OnRowDeleting="randevuGecmisiGrid2_RowDeleting" DataKeyNames="RandevuNumarası" AlternatingRowStyle-BorderStyle="NotSet" EditIndex="-1" OnRowCreated="randevuGecmisiGrid2_RowCreated"></asp:GridView><br />

                                             <asp:Label ID="Label20" runat="server" Text="GEÇMİŞ RANDEVULAR"></asp:Label>
                                <asp:GridView ID="randevuGecmisiGrid" runat="server"></asp:GridView>
                                             <asp:Label ID="randevuGuncelle" runat="server" Text="Randevunuz Gözükmüyorsa Güncelle Butonuna Tıklayın."></asp:Label>
                                           <br />  <asp:Button ID="guncelleme" runat="server" Text="Güncelle" OnClick="guncelleme_Click" />
                                             </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <!-- Randevu Geçmişi Kısmı son -------------------------------------------------------------- -->
                            <!-- Bilgileri güncelleme kısmı ----------------------------------------------- -->
                            <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                                <span class="icon flaticon-first-aid-kit"></span>

                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <asp:Panel ID="bilgilerPanel" runat="server">
                                            <div class="form-group">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label1" runat="server" Text="Tc No: " CssClass="text-black" Font-Bold="true"></asp:Label><asp:Label ID="hastaTc" runat="server" CssClass="text-black"></asp:Label></td>
                                                        <td>
                                                            <asp:Label ID="Label9" runat="server" Text="Telefon: " CssClass="text-black" Font-Bold="true"></asp:Label><asp:Label ID="telefonB" runat="server" CssClass="text-black"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label2" runat="server" Text="Ad: " CssClass="text-black" Font-Bold="true"></asp:Label><asp:Label ID="adB" runat="server" CssClass="text-black"></asp:Label></td>
                                                        <td>
                                                            <asp:Label ID="Label4" runat="server" Text="Email: " CssClass="text-black" Font-Bold="true"></asp:Label><asp:Label ID="emailB" runat="server" CssClass="text-black"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label3" runat="server" Text="Soyad: " CssClass="text-black" Font-Bold="true"></asp:Label><asp:Label ID="soyadB" runat="server" CssClass="text-black"></asp:Label></td>
                                                        <td>
                                                            <asp:Label ID="Label8" runat="server" Text="Doğum Tarihi: " CssClass="text-black" Font-Bold="true"></asp:Label><asp:Label ID="dogumTarB" runat="server" CssClass="text-black"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label5" runat="server" Text="Adres: " CssClass="text-black" Font-Bold="true"></asp:Label><asp:Label ID="adresB" runat="server" CssClass="text-black"></asp:Label></td>
                                                        <td>
                                                            <asp:Label ID="Label11" runat="server" Text="Doğum Yeri: " CssClass="text-black" Font-Bold="true"></asp:Label><asp:Label ID="dogumYerB" runat="server" CssClass="text-black"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label7" runat="server" Text="Cinsiyet: " CssClass="text-black" Font-Bold="true"></asp:Label><asp:Label ID="cinsiyetB" runat="server" CssClass="text-black"></asp:Label></td>
                                                        <td>
                                                            <asp:Label ID="Label13" runat="server" Text="Kan Grubu: " CssClass="text-black" Font-Bold="true"></asp:Label><asp:Label ID="kanGrubuB" runat="server" CssClass="text-black"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </asp:Panel>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="Guncelle" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                                <asp:Button ID="duzenle" runat="server" Text="Düzenle" CssClass="btn btn-primary" OnClick="duzenle_Click" /><br />
                                <br />

                                <!-- AJAX ile postback işlemi------------------------------------------- -->
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>

                                        <asp:Panel ID="duzenlePanel" runat="server" Visible="False">
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
                                                    <td>Kan Grubu:</td>
                                                    <td>
                                                        <asp:DropDownList ID="KanGrubu" runat="server" AutoPostBack="False"></asp:DropDownList></td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="KanGrubu" ForeColor="Red" ValidationGroup="GuncelleGrup"></asp:RequiredFieldValidator></td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Button ID="Guncelle" runat="server" Text="Güncelle" CssClass="btn btn-primary" OnClick="Guncelle_Click" ValidationGroup="GuncelleGrup" /></td>
                                                </tr>
                                            </table>

                                        </asp:Panel>

                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="duzenle" EventName="Click" />

                                    </Triggers>
                                </asp:UpdatePanel>
                                <!-- AJAX ile postback işlemi son----------------------------------------- -->
                            </div>
                            <!-- Bilgileri güncelleme kısmı son----------------------------------------------- -->
                            <!-- Şifre değiştirme kısmı ----------------------------------------------- -->
                            <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                                <span class="icon flaticon-hospital-bed"></span>
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                    <ContentTemplate>
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
                                            <asp:Label ID="uyari" runat="server"></asp:Label>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>


                            <!-- Şifre değiştirme kısmı son ----------------------------------------------- -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- -------------------------------------------------------------------------------- -->

        <!--  Hasta Panel içerik  -->


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

