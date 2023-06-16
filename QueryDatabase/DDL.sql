CREATE TABLE Brand(
    IDBrand CHAR(5) PRIMARY KEY NOT NULL,
    Nama VARCHAR(30) NOT NULL
);

CREATE TABLE Produk(
    IDProduk CHAR(5) PRIMARY KEY NOT NULL,
	Brand_IDBrand CHAR(5) NOT NULL,
    Nama VARCHAR(150) NOT NULL,
    EXPDate DATE NOT NULL,
    Harga NUMERIC(8,2) NOT NULL,
    Stok INTEGER NOT NULL
);

ALTER TABLE Produk
ADD CONSTRAINT IDBrand_Produk
FOREIGN KEY(Brand_IDBrand)
REFERENCES Brand(IDBrand);

CREATE TABLE Member(
    IDMember CHAR(5) NOT NULL PRIMARY KEY,
    Nama VARCHAR(75),
    TanggalLahir DATE,
    Email VARCHAR(30),
    NoTelp VARCHAR(15),
    Alamat VARCHAR(100),
    Poin INTEGER
);

CREATE TABLE Customer(
    IDCust CHAR(5) PRIMARY KEY NOT NULL,
    NoTelp VARCHAR(15) NOT NULL,
    Member_IDMember CHAR(5)
);

ALTER TABLE Customer
ADD CONSTRAINT Customer_IDMember
FOREIGN KEY(Member_IDMember)
REFERENCES Member(IDMember);

CREATE TABLE Staff(
    IDStaff CHAR(5) PRIMARY KEY NOT NULL,
    Nama VARCHAR(75) NOT NULL,
	TanggalLahir DATE NOT NULL,
    Email VARCHAR(30) NOT NULL,
    NoTelp VARCHAR(15) NOT NULL,
    Alamat VARCHAR(100) NOT NULL
);

CREATE TABLE Transaksi(
    IDTransaksi CHAR(5) PRIMARY KEY NOT NULL,
	Customer_IDCust CHAR(5) NOT NULL,
	Staff_IDStaff CHAR(5) NOT NULL,
    Tanggal TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    TotalHarga NUMERIC(10,2)
);

ALTER TABLE Transaksi
ADD CONSTRAINT IDCust_Transaksi
FOREIGN KEY(Customer_IDCust)
REFERENCES Customer(IDCust);

ALTER TABLE Transaksi
ADD CONSTRAINT IDStaff_Transaksi
FOREIGN KEY(Staff_IDStaff)
REFERENCES Staff(IDStaff);

CREATE TABLE DetailTransaksi(
    IDDetailTransaksi CHAR(5) PRIMARY KEY NOT NULL,
	Transaksi_IDTransaksi CHAR(5) NOT NULL,
	Produk_IDProduk CHAR(5),
    Jumlah INTEGER,
    TotalHarga NUMERIC(10,2)
);

ALTER TABLE DetailTransaksi
ADD CONSTRAINT IDTransaksi_DetailTransaksi
FOREIGN KEY(Transaksi_IDTransaksi)
REFERENCES Transaksi(IDTransaksi);

ALTER TABLE DetailTransaksi
ADD CONSTRAINT IDProduk_DetailTransaksi
FOREIGN KEY(Produk_IDProduk)
REFERENCES Produk(IDProduk);