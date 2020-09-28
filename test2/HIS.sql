create table Zaposlenik
(
	idZaposlenik int primary key identity,
	ime varchar(40),
	prezime varchar(50),
	korisnickoIme varchar (20),
	lozinka varchar(10),
	idHotel int
)
create table Gost
(
	IdGost int primary key identity,
	ime varchar(50),
	prezime varchar(70),
	DatumRodenja datetime,
	IdMjesto int
)
create table Mjesto
(
	PostanskiBroj int primary key,
	Naziv varchar(50),
	idDrzava int
)
create table Drzava
(
	IdDrzava int primary key identity,
	Naziv varchar(50)
)

create table Hotel
(
	IdHotela int primary key identity,
	NazivHotela varchar(50),
	Adresa varchar(50),
	IdMjesto int
)
create table Soba
(
	idSobe varchar(5) primary key,	/*šifra sobe bila bi kombinacija brojeva i znakova (npr. dvokrevetna soba imala bi šifru C2 ili 1/2)*/
	naziv varchar(30)
)
create table Usluga
(
	IdUsluga int primary key identity,
	NazivUsluge varchar(40),
	CijenaUsluge money /*cijena usluge po danu*/ 
)

create table Rezervacija
(
	IdRezervacije int primary key identity,
	DatumDolaska datetime,
	DatumOdlaska datetime,
	IdHotela int,
	IdZaposlenika int,
	IdGosta int,
	IdRezUsluga int,
	IdSoba varchar(5)
)
create table RezervacijaUsluga
(
	idRezervacija int,
	idUsluga int
)

 