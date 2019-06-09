CREATE DATABASE db_DisKlinik
GO
USE db_DisKlinik
CREATE TABLE tblIller
(
	ilId int identity(01,1) primary key,
	ilPlaka int,
	ilAd varchar(20) not null,
	aktif bit default 0	
)
go
CREATE TABLE tblIlceler
(
	ilceId int identity(1,1) primary key,
	ilceAd varchar(20) not null,
	ilId int FOREIGN KEY REFERENCES tblIller(ilId),
	aktif bit default 0
)
go
CREATE TABLE tblKlinik
(
	klinikId int identity(1,1) primary key,
	ilId int FOREIGN KEY REFERENCES tblIller(ilId),
	ilceId int FOREIGN KEY REFERENCES tblIlceler(ilceId),
	klinikAd varchar(75)
		CONSTRAINT ck_klinikAd
			CHECK(len(klinikAd)>=3),
	klinikAdres varchar(max) not null
		CONSTRAINT ck_klinikAdres
			CHECK(len(klinikAdres)>=3),
)
GO
CREATE TRIGGER klinik_ekleme
on tblKlinik
AFTER INSERT
AS
BEGIN
UPDATE tblIller set aktif=1 where ilId =(SELECT ilId from inserted)
UPDATE tblIlceler set aktif=1 where ilceId =(SELECT ilceId from inserted)
END
GO
CREATE TRIGGER klinik_silme
on tblKlinik
AFTER  DELETE
AS
BEGIN
DECLARE @ilId int = (select ilId from deleted)
UPDATE tblIlceler set aktif=0 where ilceId = (select ilceId from deleted)
--update tblIller set aktif=0 where ilId = (select ilId from deleted)
if not exists (select * from tblIlceler where ilId=@ilId and aktif=1)
	update tblIller set aktif=0 where ilId = (select ilId from deleted)
END
go
CREATE TABLE tblUnvan
(
	unvanId int identity(1,1) primary key,
	unvanAd varchar(30)
)
go
CREATE TABLE tblPersonel
(
	personelId int identity(1,1) primary key,
	tcNo varchar(11) not null unique
		constraint ck_tcNo
			check(len(tcNo)=11 and tcNo like ('[1-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),
	ad varchar(20)
		constraint ck_ad
			check(len(ad)>=3),	
	soyad varchar(20)
		constraint ck_soyad
			check(len(soyad)>=3),
	adres varchar(max),
	cinsiyet varchar(5)
		constraint ck_cinsiyet
			check(cinsiyet in('KADIN','ERKEK')),
	cepTel varchar(11)
		constraint ck_cepTel
			check(len(cepTel)=11 and cepTel like ('0[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),
	email varchar(max) not null,
		constraint ck_email
			check(email like ('%@%.%')),
	dogumTar date,
	dogumYer varchar(20),
	unvanId int foreign key references tblUnvan(unvanId),
	klinikId int foreign key references tblKlinik(klinikId)
)
go
CREATE TABLE tblKullanici
(
	kullanciId int identity(1,1) primary key,
	id varchar(max),
	pw varchar(max),
	pId int foreign key references tblPersonel(personelId) on delete cascade
)
go
CREATE TABLE tblHasta
(
	hastaId int identity(1,1) primary key,
	hastaTc varchar(11) not null unique
		constraint ck_hastaTc
			check(len(hastaTc)=11 and hastaTc like ('[1-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),
	ad varchar(20)
		constraint ck_had
			check(len(ad)>=3),	
	soyad varchar(20)
		constraint ck_hsoyad
			check(len(soyad)>=2),
	adres varchar(max),
	cinsiyet varchar(5)
		constraint ck_hcinsiyet
			check(cinsiyet in('KADIN','ERKEK')),
	cepTel varchar(11)
		constraint ck_hcepTel
			check(len(cepTel)=11 and cepTel like ('0[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),
	email varchar(max) not null,
		constraint ck_hemail
			check(email like ('%@%.%')),
	dogumTar date,
	dogumYer varchar(20),
	kanGrubu varchar(3)
		constraint ck_kanGrubu
			check(kanGrubu in ('A+','A-','B+','B-','0+','0-','AB+','AB-')),
	sifre varchar(max)
)
go
CREATE TABLE tblRandevu
(
	randevuId int identity(1,1) primary key,
	hastaId int foreign key references tblHasta(hastaId),
	disciId int foreign key references tblPersonel(personelId),
	gun date,
	saat int,
	silinmi� bit default 0
)
go
INSERT INTO tblIller(ilPlaka,ilAd) VALUES
('01', N'Adana'),
('02', N'Ad�yaman'),
('03', N'Afyon'),
('04', N'A�r�'),
('05', N'Amasya'),
('06', N'Ankara'),
('07', N'Antalya'),
('08', N'Artvin'),
('09', N'Ayd�n'),
('10', N'Bal�kesir'),
('11', N'Bilecik'),
('12', N'Bing�l'),
('13', N'Bitlis'),
('14', N'Bolu'),
('15', N'Burdur'),
('16', N'Bursa'),
('17', N'�anakkale'),
('18', N'�ank�r�'),
('19', N'�orum'),
('20', N'Denizli'),
('21', N'Diyarbak�r'),
('22', N'Edirne'),
('23', N'Elaz��'),
('24', N'Erzincan'),
('25', N'Erzurum'),
('26', N'Eski�ehir'),
('27', N'Gaziantep'),
('28', N'Giresun'),
('29', N'G�m��hane'),
('30', N'Hakkari'),
('31', N'Hatay'),
('32', N'Isparta'),
('33', N'Mersin'),
('34', N'�stanbul'),
('35', N'�zmir'),
('36', N'Kars'),
('37', N'Kastamonu'),
('38', N'Kayseri'),
('39', N'K�rklareli'),
('40', N'K�r�ehir'),
('41', N'Kocaeli'),
('42', N'Konya'),
('43', N'K�tahya'),
('44', N'Malatya'),
('45', N'Manisa'),
('46', N'K.Mara�'),
('47', N'Mardin'),
('48', N'Mu�la'),
('49', N'Mu�'),
('50', N'Nev�ehir'),
('51', N'Ni�de'),
('52', N'Ordu'),
('53', N'Rize'),
('54', N'Sakarya'),
('55', N'Samsun'),
('56', N'Siirt'),
('57', N'Sinop'),
('58', N'Sivas'),
('59', N'Tekirda�'),
('60', N'Tokat'),
('61', N'Trabzon'),
('62', N'Tunceli'),
('63', N'�anl�urfa'),
('64', N'U�ak'),
('65', N'Van'),
('66', N'Yozgat'),
('67', N'Zonguldak'),
('68', N'Aksaray'),
('69', N'Bayburt'),
('70', N'Karaman'),
('71', N'K�r�kkale'),
('72', N'Batman'),
('73', N'��rnak'),
('74', N'Bart�n'),
('75', N'Ardahan'),
('76', N'I�d�r'),
('77', N'Yalova'),
('78', N'Karab�k'),
('79', N'Kilis'),
('80', N'Osmaniye'),
('81', N'D�zce')
go
INSERT INTO tblIlceler(ilceAd,ilId) VALUES
(N'SEYHAN', 1),
(N'CEYHAN', 1),
(N'FEKE', 1),
(N'KARA�SALI', 1),
(N'KARATA�', 1),
(N'KOZAN', 1),
(N'POZANTI', 1),
(N'SA�MBEYL�', 1),
(N'TUFANBEYL�', 1),
(N'YUMURTALIK', 1),
(N'Y�RE��R', 1),
(N'ALADA�', 1),
(N'�MAMO�LU', 1),
(N'MERKEZ', 2),
(N'BESN�', 2),
(N'�EL�KHAN', 2),
(N'GERGER', 2),
(N'G�LBA�I', 2),
(N'KAHTA', 2),
(N'SAMSAT', 2),
(N'S�NC�K', 2),
(N'TUT', 2),
(N'MERKEZ', 3),
(N'BOLVAD�N', 3),
(N'�AY', 3),
(N'DAZKIRI', 3),
(N'D�NAR', 3),
(N'EM�RDA�', 3),
(N'�HSAN�YE', 3),
(N'SANDIKLI', 3),
(N'S�NANPA�A', 3),
(N'SULDANDA�I', 3),
(N'�UHUT', 3),
(N'BA�MAK�I', 3),
(N'BAYAT', 3),
(N'��CEH�SAR', 3),
(N'�OBANLAR', 3),
(N'EVC�LER', 3),
(N'HOCALAR', 3),
(N'KIZIL�REN', 3),
(N'MERKEZ', 68),
(N'ORTAK�Y', 68),
(N'A�A��REN', 68),
(N'G�ZELYURT', 68),
(N'SARIYAH��', 68),
(N'ESK�L', 68),
(N'G�LA�A�', 68),
(N'MERKEZ', 5),
(N'G�YN��EK', 5),
(N'G�M��HACIK�Y�', 5),
(N'MERZ�FON', 5),
(N'SULUOVA', 5),
(N'TA�OVA', 5),
(N'HAMAM�Z�', 5),
(N'ALTINDA�', 6),
(N'AYAS', 6),
(N'BALA', 6),
(N'BEYPAZARI', 6),
(N'�AMLIDERE', 6),
(N'�ANKAYA', 6),
(N'�UBUK', 6),
(N'ELMADA�', 6),
(N'G�D�L', 6),
(N'HAYMANA', 6),
(N'KALEC�K', 6),
(N'KIZILCAHAMAM', 6),
(N'NALLIHAN', 6),
(N'POLATLI', 6),
(N'�EREFL�KO�H�SAR', 6),
(N'YEN�MAHALLE', 6),
(N'G�LBA�I', 6),
(N'KE���REN', 6),
(N'MAMAK', 6),
(N'S�NCAN', 6),
(N'KAZAN', 6),
(N'AKYURT', 6),
(N'ET�MESGUT', 6),
(N'EVREN', 6),
(N'ANSEK�', 7),
(N'ALANYA', 7),
(N'MERKEZ', 7),
(N'ELMALI', 7),
(N'F�N�KE', 7),
(N'GAZ�PA�A', 7),
(N'G�NDO�MU�', 7),
(N'KA�', 7),
(N'KORKUTEL�', 7),
(N'KUMLUCA', 7),
(N'MANAVGAT', 7),
(N'SER�K', 7),
(N'DEMRE', 7),
(N'�BRADI', 7),
(N'KEMER', 7),
(N'MERKEZ', 75),
(N'G�LE', 75),
(N'�ILDIR', 75),
(N'HANAK', 75),
(N'POSOF', 75),
(N'DAMAL', 75),
(N'ARDANU�', 8),
(N'ARHAV�', 8),
(N'MERKEZ', 8),
(N'BOR�KA', 8),
(N'HOPA', 8),
(N'�AV�AT', 8),
(N'YUSUFEL�', 8),
(N'MURGUL', 8),
(N'MERKEZ', 9),
(N'BOZDO�AN', 9),
(N'��NE', 9),
(N'GERMENC�K', 9),
(N'KARACASU', 9),
(N'KO�ARLI', 9),
(N'KU�ADASI', 9),
(N'KUYUCAK', 9),
(N'NAZ�LL�', 9),
(N'S�KE', 9),
(N'SULTANH�SAR', 9),
(N'YEN�PAZAR', 9),
(N'BUHARKENT', 9),
(N'�NC�RL�OVA', 9),
(N'KARPUZLU', 9),
(N'K��K', 9),
(N'D�D�M', 9),
(N'MERKEZ', 4),
(N'D�YAD�N', 4),
(N'DO�UBEYAZIT', 4),
(N'ELE�K�RT', 4),
(N'HAMUR', 4),
(N'PATNOS', 4),
(N'TA�LI�AY', 4),
(N'TUTAK', 4),
(N'AYVALIK', 10),
(N'MERKEZ', 10),
(N'BALYA', 10),
(N'BANDIRMA', 10),
(N'B�GAD��', 10),
(N'BURHAN�YE', 10),
(N'DURSUNBEY', 10),
(N'EDREM�T', 10),
(N'ERDEK', 10),
(N'G�NEN', 10),
(N'HAVRAN', 10),
(N'�VR�ND�', 10),
(N'KEPSUT', 10),
(N'MANYAS', 10),
(N'SAVA�TEPE', 10),
(N'SINDIRGI', 10),
(N'SUSURLUK', 10),
(N'MARMARA', 10),
(N'G�ME�', 10),
(N'MERKEZ', 74),
(N'KURUCA��LE', 74),
(N'ULUS', 74),
(N'AMASRA', 74),
(N'MERKEZ', 72),
(N'BE��R�', 72),
(N'GERC��', 72),
(N'KOZLUK', 72),
(N'SASON', 72),
(N'HASANKEYF', 72),
(N'MERKEZ', 69),
(N'AYDINTEPE', 69),
(N'DEM�R�Z�', 69),
(N'MERKEZ', 14),
(N'GEREDE', 14),
(N'G�YN�K', 14),
(N'KIBRISCIK', 14),
(N'MENGEN', 14),
(N'MUDURNU', 14),
(N'SEBEN', 14),
(N'D�RTD�VAN', 14),
(N'YEN��A�A', 14),
(N'A�LASUN', 15),
(N'BUCAK', 15),
(N'MERKEZ', 15),
(N'G�LH�SAR', 15),
(N'TEFENN�', 15),
(N'YE��LOVA', 15),
(N'KARAMANLI', 15),
(N'KEMER', 15),
(N'ALTINYAYLA', 15),
(N'�AVDIR', 15),
(N'�ELT�K��', 15),
(N'GEML�K', 16),
(N'�NEG�L', 16),
(N'�ZN�K', 16),
(N'KARACABEY', 16),
(N'KELES', 16),
(N'MUDANYA', 16),
(N'MUSTAFA K. PA�A', 16),
(N'ORHANEL�', 16),
(N'ORHANGAZ�', 16),
(N'YEN��EH�R', 16),
(N'B�Y�K ORHAN', 16),
(N'HARMANCIK', 16),
(N'N�L�FER', 16),
(N'OSMAN GAZ�', 16),
(N'YILDIRIM', 16),
(N'G�RSU', 16),
(N'KESTEL', 16),
(N'MERKEZ', 11),
(N'BOZ�Y�K', 11),
(N'G�LPAZARI', 11),
(N'OSMANEL�', 11),
(N'PAZARYER�', 11),
(N'S���T', 11),
(N'YEN�PAZAR', 11),
(N'�NH�SAR', 11),
(N'MERKEZ', 12),
(N'GEN�', 12),
(N'KARLIOVA', 12),
(N'K�GI', 12),
(N'SOLHAN', 12),
(N'ADAKLI', 12),
(N'YAYLADERE', 12),
(N'YED�SU', 12),
(N'AD�LCEVAZ', 13),
(N'AHLAT', 13),
(N'MERKEZ', 13),
(N'H�ZAN', 13),
(N'MUTK�', 13),
(N'TATVAN', 13),
(N'G�ROYMAK', 13),
(N'MERKEZ', 20),
(N'ACIPAYAM', 20),
(N'BULDAN', 20),
(N'�AL', 20),
(N'�AMEL�', 20),
(N'�ARDAK', 20),
(N'��VR�L', 20),
(N'G�NEY', 20),
(N'KALE', 20),
(N'SARAYK�Y', 20),
(N'TAVAS', 20),
(N'BABADA�', 20),
(N'BEK�LL�', 20),
(N'HONAZ', 20),
(N'SER�NH�SAR', 20),
(N'AKK�Y', 20),
(N'BAKLAN', 20),
(N'BEYA�A�', 20),
(N'BOZKURT', 20),
(N'MERKEZ', 81),
(N'AK�AKOCA', 81),
(N'YI�ILCA', 81),
(N'CUMAYER�', 81),
(N'G�LYAKA', 81),
(N'��L�ML�', 81),
(N'G�M��OVA', 81),
(N'KAYNA�LI', 81),
(N'MERKEZ', 21),
(N'B�SM�L', 21),
(N'�ERM�K', 21),
(N'�INAR', 21),
(N'��NG��', 21),
(N'D�CLE', 21),
(N'ERGAN�', 21),
(N'HAN�', 21),
(N'HAZRO', 21),
(N'KULP', 21),
(N'L�CE', 21),
(N'S�LVAN', 21),
(N'E��L', 21),
(N'KOCAK�Y', 21),
(N'MERKEZ', 22),
(N'ENEZ', 22),
(N'HAVSA', 22),
(N'�PSALA', 22),
(N'KE�AN', 22),
(N'LALAPA�A', 22),
(N'MER��', 22),
(N'UZUNK�PR�', 22),
(N'S�LO�LU', 22),
(N'MERKEZ', 23),
(N'A�IN', 23),
(N'BASK�L', 23),
(N'KARAKO�AN', 23),
(N'KEBAN', 23),
(N'MADEN', 23),
(N'PALU', 23),
(N'S�VR�CE', 23),
(N'ARICAK', 23),
(N'KOVANCILAR', 23),
(N'ALACAKAYA', 23),
(N'MERKEZ', 25),
(N'PALAND�KEN', 25),
(N'A�KALE', 25),
(N'�AT', 25),
(N'HINIS', 25),
(N'HORASAN', 25),
(N'OLTU', 25),
(N'�SP�R', 25),
(N'KARAYAZI', 25),
(N'NARMAN', 25),
(N'OLUR', 25),
(N'PAS�NLER', 25),
(N'�ENKAYA', 25),
(N'TEKMAN', 25),
(N'TORTUM', 25),
(N'KARA�OBAN', 25),
(N'UZUNDERE', 25),
(N'PAZARYOLU', 25),
(N'ILICA', 25),
(N'K�PR�K�Y', 25),
(N'�AYIRLI', 24),
(N'MERKEZ', 24),
(N'�L��', 24),
(N'KEMAH', 24),
(N'KEMAL�YE', 24),
(N'REFAH�YE', 24),
(N'TERCAN', 24),
(N'OTLUKBEL�', 24),
(N'MERKEZ', 26),
(N'��FTELER', 26),
(N'MAHMUD�YE', 26),
(N'M�HALI�LIK', 26),
(N'SARICAKAYA', 26),
(N'SEY�TGAZ�', 26),
(N'S�VR�H�SAR', 26),
(N'ALPU', 26),
(N'BEYL�KOVA', 26),
(N'�N�N�', 26),
(N'G�NY�Z�', 26),
(N'HAN', 26),
(N'M�HALGAZ�', 26),
(N'ARABAN', 27),
(N'�SLAH�YE', 27),
(N'N�Z�P', 27),
(N'O�UZEL�', 27),
(N'YAVUZEL�', 27),
(N'�AH�NBEY', 27),
(N'�EH�T KAM�L', 27),
(N'KARKAMI�', 27),
(N'NURDA�I', 27),
(N'MERKEZ', 29),
(N'KELK�T', 29),
(N'��RAN', 29),
(N'TORUL', 29),
(N'K�SE', 29),
(N'K�RT�N', 29),
(N'ALUCRA', 28),
(N'BULANCAK', 28),
(N'DEREL�', 28),
(N'ESP�YE', 28),
(N'EYNES�L', 28),
(N'MERKEZ', 28),
(N'G�RELE', 28),
(N'KE�AP', 28),
(N'�EB�NKARAH�SAR', 28),
(N'T�REBOLU', 28),
(N'P�PAZ�Z', 28),
(N'YA�LIDERE', 28),
(N'�AMOLUK', 28),
(N'�ANAK�I', 28),
(N'DO�ANKENT', 28),
(N'G�CE', 28),
(N'MERKEZ', 30),
(N'�UKURCA', 30),
(N'�EMD�NL�', 30),
(N'Y�KSEKOVA', 30),
(N'ALTIN�Z�', 31),
(N'D�RTYOL', 31),
(N'MERKEZ', 31),
(N'HASSA', 31),
(N'�SKENDERUN', 31),
(N'KIRIKHAN', 31),
(N'REYHANLI', 31),
(N'SAMANDA�', 31),
(N'YAYLADA�', 31),
(N'ERZ�N', 31),
(N'BELEN', 31),
(N'KUMLU', 31),
(N'MERKEZ', 32),
(N'ATABEY', 32),
(N'KE��BORLU', 32),
(N'E��RD�R', 32),
(N'GELENDOST', 32),
(N'S�N�RKENT', 32),
(N'ULUBORLU', 32),
(N'YALVA�', 32),
(N'AKSU', 32),
(N'G�NEN', 32),
(N'YEN��AR BADEML�', 32),
(N'MERKEZ', 76),
(N'ARALIK', 76),
(N'TUZLUCA', 76),
(N'KARAKOYUNLU', 76),
(N'AF��N', 46),
(N'ANDIRIN', 46),
(N'ELB�STAN', 46),
(N'G�KSUN', 46),
(N'MERKEZ', 46),
(N'PAZARCIK', 46),
(N'T�RKO�LU', 46),
(N'�A�LAYANCER�T', 46),
(N'EK�N�Z�', 46),
(N'NURHAK', 46),
(N'EFLAN�', 78),
(N'ESK�PAZAR', 78),
(N'MERKEZ', 78),
(N'OVACIK', 78),
(N'SAFRANBOLU', 78),
(N'YEN�CE', 78),
(N'ERMENEK', 70),
(N'MERKEZ', 70),
(N'AYRANCI', 70),
(N'KAZIMKARABEK�R', 70),
(N'BA�YAYLA', 70),
(N'SARIVEL�LER', 70),
(N'MERKEZ', 36),
(N'ARPA�AY', 36),
(N'D�GOR', 36),
(N'KA�IZMAN', 36),
(N'SARIKAMI�', 36),
(N'SEL�M', 36),
(N'SUSUZ', 36),
(N'AKYAKA', 36),
(N'ABANA', 37),
(N'MERKEZ', 37),
(N'ARA�', 37),
(N'AZDAVAY', 37),
(N'BOZKURT', 37),
(N'C�DE', 37),
(N'�ATALZEYT�N', 37),
(N'DADAY', 37),(N'DEVREKAN�', 37),
(N'�NEBOLU', 37),
(N'K�RE', 37),
(N'TA�K�PR�', 37),
(N'TOSYA', 37),
(N'�HSANGAZ�', 37),
(N'PINARBA�I', 37),
(N'�ENPAZAR', 37),
(N'A�LI', 37),
(N'DO�ANYURT', 37),
(N'HAN�N�', 37),
(N'SEYD�LER', 37),
(N'B�NYAN', 38),
(N'DEVEL�', 38),
(N'FELAH�YE', 38),
(N'�NCESU', 38),
(N'PINARBA�I', 38),
(N'SARIO�LAN', 38),
(N'SARIZ', 38),
(N'TOMARZA', 38),
(N'YAHYALI', 38),
(N'YE��LH�SAR', 38),
(N'AKKI�LA', 38),
(N'TALAS', 38),
(N'KOCAS�NAN', 38),
(N'MEL�KGAZ�', 38),
(N'HACILAR', 38),
(N'�ZVATAN', 38),
(N'DER�CE', 71),
(N'KESK�N', 71),
(N'MERKEZ', 71),
(N'SALAK YURT', 71),
(N'BAH��L�', 71),
(N'BALI�EYH', 71),
(N'�ELEB�', 71),
(N'KARAKE��L�', 71),
(N'YAH��HAN', 71),
(N'MERKEZ', 39),
(N'BABAESK�', 39),
(N'DEM�RK�Y', 39),
(N'KOF�AY', 39),
(N'L�LEBURGAZ', 39),
(N'V�ZE', 39),
(N'MERKEZ', 40),
(N'���EKDA�I', 40),
(N'KAMAN', 40),
(N'MUCUR', 40),
(N'AKPINAR', 40),
(N'AK�AKENT', 40),
(N'BOZTEPE', 40),
(N'�ZM�T', 41),
(N'GEBZE', 41),
(N'G�LC�K', 41),
(N'KANDIRA', 41),
(N'KARAM�RSEL', 41),
(N'K�RFEZ', 41),
(N'DER�NCE', 41),
(N'MERKEZ', 42),
(N'AK�EH�R', 42),
(N'BEY�EH�R', 42),
(N'BOZKIR', 42),
(N'C�HANBEYL�', 42),
(N'�UMRA', 42),
(N'DO�ANH�SAR', 42),
(N'ERE�L�', 42),
(N'HAD�M', 42),
(N'ILGIN', 42),
(N'KADINHANI', 42),
(N'KARAPINAR', 42),
(N'KULU', 42),
(N'SARAY�N�', 42),
(N'SEYD��EH�R', 42),
(N'YUNAK', 42),
(N'AK�REN', 42),
(N'ALTINEK�N', 42),
(N'DEREBUCAK', 42),
(N'H�Y�K', 42),
(N'KARATAY', 42),
(N'MERAM', 42),
(N'SEL�UKLU', 42),
(N'TA�KENT', 42),
(N'AHIRLI', 42),
(N'�ELT�K', 42),
(N'DERBENT', 42),
(N'EM�RGAZ�', 42),
(N'G�NEYSINIR', 42),
(N'HALKAPINAR', 42),
(N'TUZLUK�U', 42),
(N'YALIH�Y�K', 42),
(N'MERKEZ', 43),
(N'ALTINTA�', 43),
(N'DOMAN��', 43),
(N'EMET', 43),
(N'GED�Z', 43),
(N'S�MAV', 43),
(N'TAV�ANLI', 43),
(N'ASLANAPA', 43),
(N'DUMLUPINAR', 43),
(N'H�SARCIK', 43),
(N'�APHANE', 43),
(N'�AVDARH�SAR', 43),
(N'PAZARLAR', 43),
(N'KMERKEZ', 79),
(N'ELBEYL�', 79),
(N'MUSABEYL�', 79),
(N'POLATEL�', 79),
(N'MERKEZ', 44),
(N'AK�ADA�', 44),
(N'ARAPG�R', 44),
(N'ARGUVAN', 44),
(N'DARENDE', 44),
(N'DO�AN�EH�R', 44),
(N'HEK�MHAN', 44),
(N'P�T�RGE', 44),
(N'YE��LYURT', 44),
(N'BATTALGAZ�', 44),
(N'DO�ANYOL', 44),
(N'KALE', 44),
(N'KULUNCAK', 44),
(N'YAZIHAN', 44),
(N'AKH�SAR', 45),
(N'ALA�EH�R', 45),
(N'DEM�RC�', 45),
(N'G�RDES', 45),
(N'KIRKA�A�', 45),
(N'KULA', 45),
(N'MERKEZ', 45),
(N'SAL�HL�', 45),
(N'SARIG�L', 45),
(N'SARUHANLI', 45),
(N'SELEND�', 45),
(N'SOMA', 45),
(N'TURGUTLU', 45),
(N'AHMETL�', 45),
(N'G�LMARMARA', 45),
(N'K�PR�BA�I', 45),
(N'DER�K', 47),
(N'KIZILTEPE', 47),
(N'MERKEZ', 47),
(N'MAZIDA�I', 47),
(N'M�DYAT', 47),
(N'NUSAYB�N', 47),
(N'�MERL�', 47),
(N'SAVUR', 47),
(N'YE��LL�', 47),
(N'MERKEZ', 33),
(N'ANAMUR', 33),
(N'ERDEML�', 33),
(N'G�LNAR', 33),
(N'MUT', 33),
(N'S�L�FKE', 33),
(N'TARSUS', 33),
(N'AYDINCIK', 33),
(N'BOZYAZI', 33),
(N'�AMLIYAYLA', 33),
(N'BODRUM', 48),
(N'DAT�A', 48),
(N'FETH�YE', 48),
(N'K�YCE��Z', 48),
(N'MARMAR�S', 48),
(N'M�LAS', 48),
(N'MERKEZ', 48),
(N'ULA', 48),
(N'YATA�AN', 48),
(N'DALAMAN', 48),
(N'KAVAKLI DERE', 48),
(N'ORTACA', 48),
(N'BULANIK', 49),
(N'MALAZG�RT', 49),
(N'MERKEZ', 49),
(N'VARTO', 49),
(N'HASK�Y', 49),
(N'KORKUT', 49),
(N'MERKEZ', 50),
(N'AVANOS', 50),
(N'DER�NKUYU', 50),
(N'G�L�EH�R', 50),
(N'HACIBEKTA�', 50),
(N'KOZAKLI', 50),
(N'�RG�P', 50),
(N'ACIG�L', 50),
(N'MERKEZ', 51),
(N'BOR', 51),
(N'�AMARDI', 51),
(N'ULUKI�LA', 51),
(N'ALTUNH�SAR', 51),
(N'��FTL�K', 51),
(N'AKKU�', 52),
(N'AYBASTI', 52),
(N'FATSA', 52),
(N'G�LK�Y', 52),
(N'KORGAN', 52),
(N'KUMRU', 52),
(N'MESUD�YE', 52),
(N'MERKEZ', 52),
(N'PER�EMBE', 52),
(N'ULUBEY', 52),
(N'�NYE', 52),
(N'G�LYALI', 52),
(N'G�RGENTEPE', 52),
(N'�AMA�', 52),
(N'�ATALPINAR', 52),
(N'�AYBA�I', 52),
(N'�K�ZCE', 52),
(N'KABAD�Z', 52),
(N'KABATA�', 52),
(N'BAH�E', 80),
(N'KAD�RL�', 80),
(N'MERKEZ', 80),
(N'D�Z���', 80),
(N'HASANBEYL�', 80),
(N'SUMBA�', 80),
(N'TOPRAKKALE', 80),
(N'MERKEZ', 53),
(N'ARDE�EN', 53),
(N'�AMLIHEM��N', 53),
(N'�AYEL�', 53),
(N'FINDIKLI', 53),
(N'�K�ZDERE', 53),
(N'KALKANDERE', 53),
(N'PAZAR', 53),
(N'G�NEYSU', 53),
(N'DEREPAZARI', 53),
(N'HEM��N', 53),
(N'�K�DERE', 53),
(N'AKYAZI', 54),
(N'GEYVE', 54),
(N'HENDEK', 54),
(N'KARASU', 54),
(N'KAYNARCA', 54),
(N'ADAPAZARI', 54),
(N'PAMUKOVA', 54),
(N'TARAKLI', 54),
(N'FER�ZL�', 54),
(N'KARAP�R�EK', 54),
(N'S���TL�', 54),
(N'ALA�AM', 55),
(N'BAFRA', 55),
(N'�AR�AMBA', 55),
(N'HAVZA', 55),
(N'KAVAK', 55),
(N'LAD�K', 55),
(N'CAN�K', 55),
(N'TERME', 55),
(N'VEZ�RK�PR�', 55),
(N'ASARCIK', 55),
(N'ONDOKUZMAYIS', 55),
(N'SALIPAZARI', 55),
(N'TEKKEK�Y', 55),
(N'AYVACIK', 55),
(N'YAKAKENT', 55),
(N'AYANCIK', 57),
(N'BOYABAT', 57),
(N'MERKEZ', 57),
(N'DURA�AN', 57),
(N'ERGELEK', 57),
(N'GERZE', 57),
(N'T�RKEL�', 57),
(N'D�KMEN', 57),
(N'SARAYD�Z�', 57),
(N'D�VR���', 58),
(N'GEMEREK', 58),
(N'G�R�N', 58),
(N'HAF�K', 58),
(N'�MRANLI', 58),
(N'KANGAL', 58),
(N'KOYUL H�SAR', 58),
(N'MERKEZ', 58),
(N'SU �EHR�', 58),
(N'�ARKI�LA', 58),
(N'YILDIZEL�', 58),
(N'ZARA', 58),
(N'AKINCILAR', 58),
(N'ALTINYAYLA', 58),
(N'DO�AN�AR', 58),
(N'G�LOVA', 58),
(N'ULA�', 58),
(N'BAYKAN', 56),
(N'ERUH', 56),
(N'KURTALAN', 56),
(N'PERVAR�', 56),
(N'MERKEZ', 56),
(N'��RVAR�', 56),
(N'AYDINLAR', 56),
(N'S�LEYMANPA�A', 59),
(N'�ERKEZK�Y', 59),
(N'�ORLU', 59),
(N'HAYRABOLU', 59),
(N'MALKARA', 59),
(N'MURATLI', 59),
(N'SARAY', 59),
(N'�ARK�Y', 59),
(N'MARAMARAERE�L�S�', 59),
(N'ALMUS', 60),
(N'ARTOVA', 60),
(N'MERKEZ', 60),
(N'ERBAA', 60),
(N'N�KSAR', 60),
(N'RE�AD�YE', 60),
(N'TURHAL', 60),
(N'Z�LE', 60),
(N'PAZAR', 60),
(N'YE��LYURT', 60),
(N'BA���FTL�K', 60),
(N'SULUSARAY', 60),
(N'MERKEZ', 61),
(N'AK�AABAT', 61),
(N'ARAKLI', 61),
(N'AR��N', 61),
(N'�AYKARA', 61),
(N'MA�KA', 61),
(N'OF', 61),
(N'S�RMENE', 61),
(N'TONYA', 61),
(N'VAKFIKEB�R', 61),
(N'YOMRA', 61),
(N'BE��KD�Z�', 61),
(N'�ALPAZARI', 61),
(N'�AR�IBA�I', 61),
(N'DERNEKPAZARI', 61),
(N'D�ZK�Y', 61),
(N'HAYRAT', 61),
(N'K�PR�BA�I', 61),
(N'MERKEZ', 62),
(N'�EM��GEZEK', 62),
(N'HOZAT', 62),
(N'MAZG�RT', 62),
(N'NAZ�M�YE', 62),
(N'OVACIK', 62),
(N'PERTEK', 62),
(N'P�L�M�R', 62),
(N'BANAZ', 64),
(N'E�ME', 64),
(N'KARAHALLI', 64),
(N'S�VASLI', 64),
(N'ULUBEY', 64),
(N'MERKEZ', 64),
(N'BA�KALE', 65),
(N'MERKEZ', 65),
(N'EDREM�T', 65),
(N'�ATAK', 65),
(N'ERC��', 65),
(N'GEVA�', 65),
(N'G�RPINAR', 65),
(N'MURAD�YE', 65),
(N'�ZALP', 65),
(N'BAH�ESARAY', 65),
(N'�ALDIRAN', 65),
(N'SARAY', 65),
(N'MERKEZ', 77),
(N'ALTINOVA', 77),
(N'ARMUTLU', 77),
(N'�INARCIK', 77),
(N'��FTL�KK�Y', 77),
(N'TERMAL', 77),
(N'AKDA�MADEN�', 66),
(N'BO�AZLIYAN', 66),
(N'MERKEZ', 66),
(N'�AYIRALAN', 66),
(N'�EKEREK', 66),
(N'SARIKAYA', 66),
(N'SORGUN', 66),
(N'�EFAATLI', 66),
(N'YERK�Y', 66),
(N'KADI�EHR�', 66),
(N'SARAYKENT', 66),
(N'YEN�FAKILI', 66),
(N'�AYCUMA', 67),
(N'DEVREK', 67),
(N'MERKEZ', 67),
(N'ERE�L�', 67),
(N'ALAPLI', 67),
(N'G�K�EBEY', 67),
(N'MERKEZ', 17),
(N'AYVACIK', 17),
(N'BAYRAM��', 17),
(N'B�GA', 17),
(N'BOZCAADA', 17),
(N'�AN', 17),
(N'ECEABAT', 17),
(N'EZ�NE', 17),
(N'LAPSEK�', 17),
(N'YEN�CE', 17),
(N'MERKEZ', 18),
(N'�ERKE�', 18),
(N'ELD�VAN', 18),
(N'ILGAZ', 18),
(N'KUR�UNLU', 18),
(N'ORTA', 18),
(N'�ABAN�Z�', 18),
(N'YAPRAKLI', 18),
(N'ATKARACALAR', 18),
(N'KIZILIRMAK', 18),
(N'BAYRAM�REN', 18),
(N'KORGUN', 18),
(N'ALACA', 19),
(N'BAYAT', 19),
(N'MERKEZ', 19),
(N'�KS�PL�', 19),
(N'KARGI', 19),
(N'MEC�T�Z�', 19),
(N'ORTAK�Y', 19),
(N'OSMANCIK', 19),
(N'SUNGURLU', 19),
(N'DODURGA', 19),
(N'LA��N', 19),
(N'O�UZLAR', 19),
(N'ADALAR', 34),
(N'BAKIRK�Y', 34),
(N'BE��KTA�', 34),
(N'BEYKOZ', 34),
(N'BEYO�LU', 34),
(N'�ATALCA', 34),
(N'EM�N�N�', 34),
(N'EY�P', 34),
(N'FAT�H', 34),
(N'GAZ�OSMANPA�A', 34),
(N'KADIK�Y', 34),
(N'KARTAL', 34),
(N'SARIYER', 34),
(N'S�L�VR�', 34),
(N'��LE', 34),
(N'���L�', 34),
(N'�SK�DAR', 34),
(N'ZEYT�NBURNU', 34),
(N'B�Y�K�EKMECE', 34),
(N'KA�ITHANE', 34),
(N'K���K�EKMECE', 34),
(N'PEND�K', 34),
(N'�MRAN�YE', 34),
(N'BAYRAMPA�A', 34),
(N'AVCILAR', 34),
(N'BA�CILAR', 34),
(N'BAH�EL�EVLER', 34),
(N'G�NG�REN', 34),
(N'MALTEPE', 34),
(N'SULTANBEYL�', 34),
(N'TUZLA', 34),
(N'ESENLER', 34),
(N'AL�A�A', 35),
(N'BAYINDIR', 35),
(N'BERGAMA', 35),
(N'BORNOVA', 35),
(N'�E�ME', 35),
(N'D�K�L�', 35),
(N'FO�A', 35),
(N'KARABURUN', 35),
(N'KAR�IYAKA', 35),
(N'KEMALPA�A', 35),
(N'KINIK', 35),
(N'K�RAZ', 35),
(N'MENEMEN', 35),
(N'�DEM��', 35),
(N'SEFER�H�SAR', 35),
(N'SEL�UK', 35),
(N'T�RE', 35),
(N'TORBALI', 35),
(N'URLA', 35),
(N'BEYDA�', 35),
(N'BUCA', 35),
(N'KONAK', 35),
(N'MENDERES', 35),
(N'BAL�OVA', 35),
(N'��GL�', 35),
(N'GAZ�EM�R', 35),
(N'NARLIDERE', 35),
(N'G�ZELBAH�E', 35),
(N'MERKEZ', 63),
(N'AK�AKALE', 63),
(N'B�REC�K', 63),
(N'BOZOVA', 63),
(N'CEYLANPINAR', 63),
(N'HALFET�', 63),
(N'H�LVAN', 63),
(N'S�VEREK', 63),
(N'SURU�', 63),
(N'V�RAN�EH�R', 63),
(N'HARRAN', 63),
(N'BEYT���EBAP', 73),
(N'MERKEZ', 73),
(N'C�ZRE', 73),
(N'�D�L', 73),
(N'S�LOP�', 73),
(N'ULUDERE', 73),
(N'G��L�KONAK', 73)
go
INSERT tblKlinik VALUES (55,669,N'E�K�N �ZEL D�� KL�N���',N'E�K�N MAHALLES� D�LARA SOKAK NO:55')
INSERT tblKlinik VALUES (22,272,N'CEV�Z �ZEL D�� KL�N���',N'CEV�Z MAHALLELS� ABDULLAH SOKAK NO:22')
INSERT tblKlinik VALUES (22,270,N'T�TREK �ZEL D�� KL�N���',N'T�TREK MAHALLES� HASAN SOKAK NO:22')
INSERT tblKlinik VALUES (28,350,N'KARADEN�Z �ZEL D�� KL�N���',N'GEZM�� MAHALLES� �SMA�L CAN SOKAK NO:28')
INSERT tblKlinik VALUES (52,622,N'AKTA� �ZEL D�� KL�N���',N'AKTA� MAHALLES� FURKAN SOKAK NO :52')
INSERT tblKlinik VALUES (34,865,N'G�LC� �ZEL D�� KL�N���',N'G�LC� MAHALLES� M�BAREK SOKAK NO:34')
go
INSERT INTO tblUnvan VALUES
(N'GENEL M�D�R'),
(N'D����'),
(N'SEKRETER')
go
INSERT INTO tblPersonel values('10000000000','Arif','C�heylan','�stanbul','ERKEK','05320000000','c�heylan@arif.net','01-01-1993','�stanbul',1,6)
INSERT INTO tblPersonel values('10000000001','Dilara','E�kin','Samsun','KADIN','05320000001','e�kin@dilara.net','01-01-1996','Samsun',2,1)
INSERT INTO tblPersonel values('10000000002','Ali','E�kin','Samsun','ERKEK','05320000002','e�kin@ali.net','01-01-2004','Samsun',2,1)
INSERT INTO tblPersonel values('10000000003','Cansu','E�kin','Samsun','KADIN','05320000003','e�kin@cansu.net','01-01-1991','Samsun',3,1)
INSERT INTO tblPersonel values('10000000004','Abdullah','Ceviz','Edirne','ERKEK','05320000004','ceviz@abdullah.net','01-01-1996','Edirne',3,2)
INSERT INTO tblPersonel values('10000000005','��kr�','Ceviz','Edirne','ERKEK','05320000005','ceviz@��kr�.net','01-01-1990','Edirne',2,2)
INSERT INTO tblPersonel values('10000000006','Merve','Ceviz','Edirne','KADIN','05320000006','ceviz@merve.net','01-01-1993','Edirne',2,2)
INSERT INTO tblPersonel values('10000000007','Hasan','Titrek','Edirne','ERKEK','05320000007','titrek@hasan.net','01-01-1997','Edirne',2,3)
INSERT INTO tblPersonel values('10000000008','Hikmet','Titrek','Edirne','ERKEK','05320000008','titrek@baytarhikmet.net','01-01-1993','Edirne',2,3)
INSERT INTO tblPersonel values('10000000009','Dilay','Titrek','Edirne','KADIN','05320000009','titrek@dilay.net','01-01-1997','Edirne',3,3)
INSERT INTO tblPersonel values('10000000010','Samet','Yall�kaya','Afyonkarahisar','ERKEK','05320000010','yall�kaya@samet.net','01-01-1988','Afyonkarahisr',2,4)
INSERT INTO tblPersonel values('10000000011','�smail Can','Gezmi�','Giresun','ERKEK','05320000011','can@gezmis.net','01-01-1996','Giresun',2,4)
INSERT INTO tblPersonel values('10000000012','Emre','Karadeniz','Giresun','ERKEK','05320000012','karadeniz@emre.net','01-01-1996','Giresun',3,4)
INSERT INTO tblPersonel values('10000000013','Furkan','Akta�','Ordu','ERKEK','05320000013','aktas@furkan.net','01-01-1996','Ordu',2,5)
INSERT INTO tblPersonel values('10000000014','K�bra','Akta�','Ordu','KADIN','05320000014','aktas@k�bra.net','01-01-1996','Ordu',2,5)
INSERT INTO tblPersonel values('10000000015','Yasin','Akp�nar','Sivas/Zara','ERKEK','05320000015','yasin@zarali.net','01-01-1996','Sivas',3,5)
INSERT INTO tblPersonel values('10000000016','Yasin','G�lc�','Yozgat','ERKEK','05320000016','yasin@g�lc�.net','01-01-1995','Yozgat',2,6)
INSERT INTO tblPersonel values('10000000017','S�meyra','G�lc�','�stanbul','KADIN','05320000017','s�meyra@g�lc�.net','01-01-1999','�stanbul',3,6)
GO
INSERT INTO tblKullanici values
('arif','c�heylan',1),
('dilara','e�kin',2),
('ali','e�kin',3),
('cansu','e�kin',4),
('abdullah','ceviz',5),
('��kr�','ceviz',6),
('merve','ceviz',7),
('hasan,','titrek',8),
('hikemt','titrek',9),
('dilay','titrek',10),
('samet','yall�kaya',11),
('can','gezmi�',12),
('emre','karadeniz',13),
('furkan','akta�',14),
('k�bra','akta�',15),
('yasin2','akp�nar',16),
('yasin','g�lc�',17),
('s�meyra','g�lc�',18)
go
--SELECT * from tblIlceler where ilId = 22
--SELECT * FROM tblIller where ilId = 22
--select * from tblKlinik
--delete from tblKlinik where klinikId=3
/*use master drop database db_DisKlinik*/ 