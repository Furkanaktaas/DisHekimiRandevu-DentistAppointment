<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GenelMudurr.aspx.cs" Inherits="WebProjeTemplate.GenelMudurr" %>


<!DOCTYPE html>

<html>
<head runat="server">
    <title>Genel Müdür Panel</title>
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
                            <asp:Button ID="Button1" OnClick="CikisBtn_Click" runat="server" Text="Çıkış Yap" CssClass="btn btn-primary" TabIndex="10" />
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
        <!-- Genel Müdür Panel içerik -->

        <section class="section bg-light custom-tabs">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 border-right element-animate" data-animate-effect="fadeInLeft">
                        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                            <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true"><span>01</span> Personel Sil/Güncelle</a>
                            <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false"><span>02</span> Klinik/Personel Ekle</a>
                            <a class="nav-link" id="v-pills-messages-tab2" data-toggle="pill" href="#v-pills-messages2" role="tab" aria-controls="v-pills-messages" aria-selected="false"><span>03</span> Hastaları Yönet</a>
                            <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false"><span>04</span> Randevu Geçmişi</a>
                            <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false"><span>05</span> Bilgileri Güncelle</a>
                            
                        </div>
                    </div>
                    <div class="col-md-1"></div>

                    <div class="col-md-7 element-animate" data-animate-effect="fadeInLeft">
                        <div class="tab-content" id="v-pills-tabContent">






                            <!----PERSONELLERİ YÖNET ------------------------>
                            <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab" >
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                <!-- KLİNİK GRİDVİEW BAŞLANGIÇ----------------------->
                                        KLİNİK SECİN: <asp:DropDownList ID="kliniklistesi" AutoPostBack="true" runat="server" OnSelectedIndexChanged="kliniklistesi_SelectedIndexChanged"></asp:DropDownList>
                               
                                <div id="bos" style="overflow-x:auto"> 
                                <asp:GridView ID="calisanlar" runat="server" DataKeyNames="PersonelNumarası" AutoGenerateDeleteButton="True" OnRowDeleting="calisanlar_RowDeleting"   OnSelectedIndexChanged="calisanlar_SelectedIndexChanged" AutoGenerateSelectButton="True"></asp:GridView>
                                </div>
                                               </ContentTemplate>
                                </asp:UpdatePanel>
                                 <!-- KLİNİK GRİDVİEW BAŞLANGIÇ SON----------------------->
                                    <!--PERSONEL DÜZENLE --------------->
                                        <br /><br />
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <asp:Panel ID="personelduzenle" runat="server" Visible="false">
                                            <table>
                                                   <tr>
                                                    <td>Tc Kimlik No:</td>
                                                    <td>
                                                        <asp:TextBox ID="personeltc" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>Ad:</td>
                                                    <td>
                                                        <asp:TextBox ID="personeladi" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>

                                                 <tr>
                                                    <td>Soyad:</td>
                                                    <td>
                                                        <asp:TextBox ID="personelsoyadi" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                 <tr>
                                                    <td>Adres:</td>
                                                    <td>
                                                        <asp:TextBox ID="personeladres" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                 <tr>
                                                    <td>Personel Cinsiyet</td>
                                                    <td>
                                                        <asp:RadioButton ID="erkekpersonelguncelle" Text="ERKEK" GroupName="cinsiyet" runat="server" />
                                                        <asp:RadioButton ID="kadinpersonelguncelle" Text="KADIN" GroupName="cinsiyet" runat="server" />
                                                    </td>
                                                </tr>
                                                 <tr>
                                                    <td>Cep Telefonu:</td>
                                                    <td>
                                                        <asp:TextBox ID="personeltelefon" runat="server"></asp:TextBox>
                                                    </td>
                                               </tr>                                               
                                                 <tr>
                                                    <td>Email:</td>
                                                    <td>
                                                        <asp:TextBox ID="personelemail" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                    <tr>
                                                    <td>Dogum Tarihi:</td>
                                                    <td>
                                                        <asp:DropDownList ID="personelgun" runat="server"></asp:DropDownList>
                                                        <asp:DropDownList ID="personelay" runat="server"></asp:DropDownList>
                                                        <asp:DropDownList ID="personelyil" runat="server"></asp:DropDownList>
                                                    </td>
                                                </tr>
                                                   <tr>
                                                    <td>Doğum Yeri:</td>
                                                    <td>
                                                        <asp:TextBox ID="personeldogumyeri" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                    <tr>
                                                    <td>Unvan:</td>
                                                    <td>
                                                        <asp:DropDownList ID="personelunvan" runat="server"></asp:DropDownList>
                                                    </td>
                                                </tr>
                                                    <tr>
                                                    <td>Klinik:</td>
                                                    <td>
                                                        <asp:DropDownList ID="personelklinik" runat="server"></asp:DropDownList>
                                                    </td>
                                                </tr>                                           
                                                 <tr>
                                                    <td> </td>
                                                    <td>
                                                        <asp:Button ID="personelGuncelle" runat="server" Text="GÜNCELLE" OnClick="personelGuncelle_Click" />
                                                    </td>
                                                </tr>                         
                                            </table>
                                       </asp:Panel>     
                                    <!--PERSONEL DÜZENLE SONU--------------->
                                         </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            
                            <!----PERSONELLERİ YÖNET  SON----------------------- ---->

                            












                               
                                  <!---- KLİNİK PERSONEL EKLE BAŞLANGICI ------------------------>
                             <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                               
                                   <!-- PERSONEL EKLE BAŞLANGICI ---------------->
                                      
                              <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                    <ContentTemplate>
                                        <h3>PERSONEL EKLE</h3>                         
                                           <asp:Panel ID="panelekle" runat="server" >
                                          <table>
                                                   <tr> 
                                                    <td>Tc Kimlik No:</td>
                                                    <td>
                                                        <asp:TextBox ID="tcpersonelekle" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>Ad:</td>
                                                    <td>
                                                        <asp:TextBox ID="adpersonelekle" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>

                                                 <tr>
                                                    <td>Soyad:</td>
                                                    <td>
                                                        <asp:TextBox ID="soyadpersonelekle" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>

                                              
                                                 <tr>
                                                    <td>Adres:</td>
                                                    <td>
                                                        <asp:TextBox ID="adrespersonelekle" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                 <tr>
                                                    <td>Personel Cinsiyet</td>
                                                    <td>
                                                        <asp:RadioButton ID="erkekpersonelekle" Checked="true" Text="ERKEK" GroupName="grup" runat="server" />
                                                        <asp:RadioButton ID="kadinpersonelekle" Text="KADIN" GroupName="grup" runat="server" />
                                                    </td>
                                                </tr>
                                                 <tr>
                                                    <td>Cep Telefonu:</td>
                                                    <td>
                                                        <asp:TextBox ID="ceptelefonupersonelekle" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                
                                                 <tr>
                                                    <td>Email:</td>
                                                    <td>
                                                        <asp:TextBox ID="emailpersonelekle" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>

                                                    <tr>
                                                    <td>Dogum Tarihi:</td>
                                                    <td>
                                                        <asp:DropDownList id="gunpersonelekle" runat="server"></asp:DropDownList>
                                                        <asp:DropDownList id="aypersonelekle" runat="server"></asp:DropDownList>
                                                        <asp:DropDownList id="yilpersonelekle" runat="server"></asp:DropDownList>
                                                    </td>
                                                </tr>

                                                    <tr>
                                                    <td>Doğum Yeri:</td>
                                                    <td>
                                                        <asp:TextBox ID="dogumyeripersonelekle" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                    <tr>
                                                    <td>Unvan:</td>
                                                    <td>
                                                        <asp:DropDownList ID="unvanpersonelekle" runat="server"></asp:DropDownList>
                                                    </td>
                                                </tr>
                                                    <tr>
                                                    <td>Klinik:</td>
                                                    <td>
                                                        <asp:DropDownList ID="klinikpersonelekle" runat="server"></asp:DropDownList>
                                                    </td>
                                                </tr>
                                               <tr>
                                                    <td>Kullanıcı Adı:</td>
                                                    <td><asp:TextBox ID="kullaniciadipersonelekle" runat="server"></asp:TextBox></td>
                                                </tr>
                                                 <tr>
                                                    <td>Şifre:</td>
                                                    <td><asp:TextBox ID="sifrepersonelekle" runat="server" ></asp:TextBox></td>
                                                </tr>
                                            
                                                 <tr>
                                                    <td> </td>
                                                    <td>
                                                    <asp:Button ID="personelekle" runat="server" Text="PERSONELİ EKLE" OnClick="personelekle_Click" />   
                                                    </td>
                                                </tr>                                                      
                                            </table>
                                            </asp:Panel>
                                          </ContentTemplate>
                                        </asp:UpdatePanel>
                                
                                 <!-- PERSONEL EKLE  SONU---------------->

                                        <!--KLİNİK EKLE BAŞLANGICI-------->
                                 
                                         <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                    <ContentTemplate>
                                        <asp:Panel ID="panelklinikekle" runat="server">
                                            <br />
                                            <h3>KLİNİK EKLE</h3>
                                                <table>
                                        <tr>
                                            <td>İl:</td>
                                            <td><asp:DropDownList ID="ilklinikekle" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ilklinikekle_SelectedIndexChanged"></asp:DropDownList></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>İlçe:</td>
                                            <td><asp:DropDownList ID="ilceklinikekle" runat="server" AutoPostBack="True"></asp:DropDownList></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>Klinik Adı:</td>
                                            <td><asp:TextBox ID="klinikAdklinikekle" runat="server"></asp:TextBox></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>Klinik Adres:</td>
                                            <td><asp:TextBox ID="klinikAdresklinikekle" runat="server"></asp:TextBox></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td><asp:Button runat="server" ID="klinikEkleBtn" Text="KLİNİK EKLE" OnClick="klinikEkleBtn_Click"/></td>
                                            <td><asp:Label ID="klinikEkleLbl" runat="server"></asp:Label></td>
                                        </tr>
                                    </table>
                                            </asp:Panel>
                                             </ContentTemplate>
                                        </asp:UpdatePanel>     
                                     
                                        <!--KLİNİK EKLE SONU-------------->
                                            
                                        </div>
                            <!---- KLİNİK PERSONEL EKLE SONU ------------------------>

                            <!------ HASTALARI YÖNET----------------->
                            <div class="tab-pane fade" id="v-pills-messages2" role="tabpanel" aria-labelledby="v-pills-messages-tab" style="overflow-x:auto">
                                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                    <ContentTemplate>                              
                                 <asp:GridView ID="hastaGrid" DataKeyNames="hastaId" runat="server" AutoGenerateDeleteButton="True" OnRowCreated="hastaGrid_RowCreated" OnRowDeleting="hastaGrid_RowDeleting"></asp:GridView>
                                        </ContentTemplate>
                                  </asp:UpdatePanel>
                            </div>

                            <!---------- RANDEVU GEÇMİŞİ ---------------------------->


                             <!-- Randevu Geçmişi kısmı ----------------------------------------------- -->
                            <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                                 <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                    <ContentTemplate>
                                <asp:GridView ID="randevuGrid" runat="server"></asp:GridView>
                                        </ContentTemplate>
                                        </asp:UpdatePanel>
                             </div>
                                <!-- RANDEVU GEÇMİŞİ SON----------------------------------------------- -->


                              <!-- Bilgileri Güncelle kısmı ----------------------------------------------- -->
                            <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                                <h3>Bilgileri Güncelle</h3>
                                 <asp:UpdatePanel ID="UpdatePanel7" runat="server"><ContentTemplate>
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
                                <br />
                                <h3>Şifre Değiştir</h3>
                                <asp:UpdatePanel ID="UpdatePanel8" runat="server"><ContentTemplate> 
                                <div class="form-group">
                                            <asp:Label ID="Label6" runat="server" Text="Şuanki Şifrenizi Giriniz:" CssClass="text-black"></asp:Label>
                                            <asp:TextBox ID="eskiSifre" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="eskiSifre" ForeColor="Red" Display="Static" ValidationGroup="SifreGuncelle"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="Label10" runat="server" Text="Yeni Şifre:" CssClass="text-black"></asp:Label>
                                            <asp:TextBox ID="yeniSifre" runat="server" CssClass="form-control" TextMode="Password" TabIndex="2"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="yeniSifre" ForeColor="Red" Display="Static" ValidationGroup="SifreGuncelle"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="Label12" runat="server" Text="Yeni Şifre Tekrar:" CssClass="text-black"></asp:Label>
                                            <asp:TextBox ID="yeniSifre2" runat="server" CssClass="form-control" TextMode="Password" TabIndex="3"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="yeniSifre2" ForeColor="Red" Display="Dynamic" ValidationGroup="SifreGuncelle"></asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Şifreler Aynı Değil" ControlToCompare="yeniSifre" ControlToValidate="yeniSifre2" Display="Dynamic" ForeColor="Red" ValidationGroup="SifreGuncelle"></asp:CompareValidator>
                                            <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="SifreGuncelle" />
                                        </div>
                                        <div class="form-group">
                                            <asp:Button ID="sifreDegistirBtn" runat="server" Text="Değiştir" CssClass="btn btn-primary" OnClick="sifreDegistirBtn_Click" ValidationGroup="SifreGuncelle" TabIndex="4" /><br />
                                            <asp:Label ID="uyari2" runat="server"></asp:Label>
                                        </div>
                                </ContentTemplate></asp:UpdatePanel> 
                            </div>
                            <!-- Bilgileri Güncelle kısmı son ----------------------------------------------- -->





                          </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Genel Müdür Panel içerik Son  -->


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

