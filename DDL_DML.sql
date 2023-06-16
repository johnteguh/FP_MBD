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

--Display Tabel
SELECT * FROM Brand;
SELECT * FROM Produk;
SELECT * FROM Member;
SELECT * FROM Customer;
SELECT * FROM Staff;
SELECT * FROM Transaksi;
SELECT * FROM DetailTransaksi;

--Insert Data pada Tabel Brand, Produk, Customer, dan Staff
INSERT INTO Brand VALUES
	('B0001', 'SOMETHINC'),
    ('B0002', 'AVOSKIN'),
    ('B0003', 'AZARINE'),
    ('B0004', 'WARDAH'),
    ('B0005', 'ERHA'),
    ('B0006', 'SCARLET'),
    ('B0007', 'EMINA'),
    ('B0008', 'LACOCO'),
    ('B0009', 'JOYLAB'),
    ('B0010', 'NPURE'),
    ('B0011', 'BHUMI'),
    ('B0012', 'KLEVERU'),
    ('B0013', 'SKIN DEWI'),
    ('B0014', 'GRACE AND GLOW'),
    ('B0015', 'THE BATH BOX');
	
INSERT INTO Produk VALUES
    ('P0001', 'B0001', '5% Niacinamide + Moisture Sabi Beet Serum', '2025-03-24', 89000.00, 52),
    ('P0002', 'B0001', 'Low pH Gentle Jelly Cleanser', '2024-12-29', 99000.00, 38),
    ('P0003', 'B0001', 'Holyshield! UV Watery Sunscreen Gel SPF 50+ PA++++', '2025-09-15', 49000.00, 44),
    ('P0004', 'B0001', 'GLOW MAKER AHA BHA PHA Clarifying Treatment Toner', '2024-11-18', 119000.00, 27),
    ('P0005', 'B0002', 'Perfect Hydrating Treatment Essence', '2024-07-08', 145552.00, 63),
    ('P0006', 'B0002', 'YOUR SKIN BAE SERIES ByeAcne ByeBlackhead Salicylic Acid 2% + Zinc', '2026-01-12', 132698.00, 52),
    ('P0007', 'B0002', 'Miraculous Retinol Ampoule', '2025-08-28', 253000.00, 24),
    ('P0008', 'B0002', 'Miraculous Refining Serum', '2025-07-10', 243232.00, 36),
    ('P0009', 'B0002', 'Natural Sublime Facial Cleanser', '2025-11-09', 113606.00, 49),
    ('P0010', 'B0003', 'Hydrashoothe Sunscreen Gel Spf45+++', '2025-08-31', 65000.00, 58),
    ('P0011', 'B0003', 'Cleansing Moist Micellar Water Complete Solutions', '2025-10-11', 39000.00, 33),
    ('P0012', 'B0003', 'Brightening Facial Cleanser C White', '2025-11-25', 35000.00, 29),
    ('P0013', 'B0003', 'Acne Spot Gel', '2025-09-03', 45000.00, 53),
    ('P0014', 'B0003', 'Lightening Serum C White', '2025-09-15', 52500.00, 28),
    ('P0015', 'B0003', 'Revitalizing Anti Aging Serum', '2025-09-13', 75000.00, 39),
    ('P0016', 'B0004', 'C-Defense Serum', '2025-10-21', 84000.00, 48),
    ('P0017', 'B0004', 'Crystal Secret Brightening Day Cream', '2025-12-17', 105000.00, 41),
    ('P0018', 'B0004', 'Acnederm Pore Blackhead Balm', '2026-01-15', 41500.00, 19),
    ('P0019', 'B0004', 'Crystallure Superme Activating Booster Essence', '2025-12-05', 275000.00, 37),
    ('P0020', 'B0004', 'Renew You Toner Essence', '2025-12-27', 163000.00, 36),
    ('P0021', 'B0005', 'ERHA Acne Spot Gel', '2025-11-02', 65000.00, 31),
    ('P0022', 'B0005', 'Erhair Hair Loss Tonic', '2025-08-11', 93750.00, 30),
    ('P0023', 'B0005', 'ERHA 21 Age Corrector Serum', '2025-09-13', 191000.00, 28),
    ('P0024', 'B0005', 'ERHA Acne Sun Friendly', '2025-11-19', 90953.00, 45),
    ('P0025', 'B0005', 'ERHA Truwhite Niacinamide and Pineapple Enzyme Brightening', '2025-11-14', 115500.00, 25),
    ('P0026', 'B0006', 'Scarlett Whitening Facial Wash', '2025-12-09', 82500.00, 55),
    ('P0027', 'B0006', 'Scarlett Whitening Glowtening Serum', '2026-02-04', 75000.00, 37),
    ('P0028', 'B0006', 'Scarlett Whitening Acne Night Cream', '2025-11-01', 82500.00, 59),
    ('P0029', 'B0006', 'Scarlett Whitening Herbalism Mugwort Mask', '2025-10-04', 70125.00, 62),
    ('P0030', 'B0006', 'Scarlett Whitening Brightly Essence Toner', '2025-09-20', 86000.00, 33),
    ('P0031', 'B0007', 'Bright Stuff Face Serum', '2025-12-16', 53500.00, 31),
    ('P0032', 'B0007', 'Sun Battle SPF 45 PA+++', '2025-10-13', 49500.00, 28),
    ('P0033', 'B0007', 'Clay Mask Brightening', '2025-11-06', 39500.00, 54),
    ('P0034', 'B0007', 'Aqua Infused Sleeping Mask', '2025-10-05', 37500.00, 51),
    ('P0035', 'B0007', 'Bright Stuff Face Wash', '2026-02-16', 29000.00, 15),
    ('P0036', 'B0008', 'Dark Spot Essence', '2025-12-31', 204600.00, 46),
    ('P0037', 'B0008', 'Intensive Treatment Eye Serum', '2026-01-22', 176000.00, 39),
    ('P0038', 'B0008', 'Watermelon Glow Mask', '2026-01-26', 125000.00, 32),
    ('P0039', 'B0008', 'Aloe Vera Soothing Mist', '2025-11-25', 230000.00, 54),
    ('P0040', 'B0008', 'Daily UV Counter SPF 50 PA++', '2025-11-18', 117000.00, 60),
    ('P0041', 'B0009', 'BRIGHTER SUN-DAY SPF50 PA++', '2024-07-19', 160000.00, 31),
    ('P0042', 'B0009', 'CITRUS COMB TONER', '2024-05-30', 170000.00, 21),
    ('P0043', 'B0009', 'MOISTURE BOMB PUDDING GEL CREME', '2024-11-14', 157500.00, 10),
    ('P0044', 'B0009', 'GOTTA SMOOTH GENTLE EXFOLIATING CLEANSER', '2026-07-22', 145000.00, 26),
    ('P0045', 'B0010', 'Centella Asiatica Face Toner', '2025-02-11', 110000.00, 18),
    ('P0046', 'B0010', 'Cica Clear Pad', '2024-08-18', 138894.00, 34),
    ('P0047', 'B0010', 'Cica Beat The Sun SPF 50 PA ++++', '2026-03-12', 160428.00, 48),
    ('P0048', 'B0010', 'Cica Biome Acne Serum Essence', '2024-11-14', 111000.00, 44),
    ('P0049', 'B0010', 'Cica Chocomint Clay Mask', '2025-07-29', 132090.00, 37),
    ('P0050', 'B0011', 'C+ Brightening Booster', '2026-07-22', 184875.00, 35),
    ('P0051', 'B0011', 'HPR Retinol Serum', '2025-05-17', 277950.00, 16),
    ('P0052', 'B0011', 'Multi Targeted All Natural Adoring Face Oil', '2024-01-24', 223848.00, 15),
    ('P0053', 'B0011', 'G-Alpine Hydra Lock Moisturizer', '2025-02-11', 207000.00, 39),
    ('P0054', 'B0011', 'Claire Vibrant Booster', '2025-11-23', 170085.00, 32),
    ('P0055', 'B0012', 'Kleveru Sea Buckthorn Cleansing Gel', '2026-01-31', 77700.00, 22),
    ('P0056', 'B0012', 'Kleveru Sea Buckthorn Day Cream', '2024-09-13', 110000.00, 10),
    ('P0057', 'B0012', 'Kleveru Ceramide Calm Face Oil', '2026-08-06', 137000.00, 34),
    ('P0058', 'B0012', 'Kleveru Glass Skin Overnight Serum', '2025-04-09', 158000.00, 18),
    ('P0059', 'B0013', 'Skin Dewi Helichrysum Brightening Vitamin C Treatment', '2024-03-04', 203500.00, 27),
    ('P0060', 'B0013', 'Skin Dewi Temulawak Balancing Facial Emulsion', '2024-06-21', 194500.00, 36),
    ('P0061', 'B0013', 'Skin Dewi Hazelnut Cleansing Milk', '2025-01-07', 220000.00, 19),
    ('P0062', 'B0013', 'Skin Dewi Sea Buckthorn Reviving Elixir', '2026-04-25', 385000.00, 31),
    ('P0063', 'B0013', 'Skin Dewi Tamanu Green Serum', '2024-02-16', 305800.00, 11),
    ('P0064', 'B0014', 'Grace and Glow Black Opium Body Wash', '2025-09-28', 52000.00, 26),
    ('P0065', 'B0014', 'Grace and Glow English Pear Body Wash', '2024-12-29', 54400.00, 20),
    ('P0066', 'B0014', 'Grace and Glow Baccarat Rouge 540 Body Wash', '2024-07-07', 50400.00, 38),
    ('P0067', 'B0014', 'Grace and Glow Peony Blush Body Wash', '2025-10-18', 53400.00, 14),
    ('P0068', 'B0014', 'Grace and Glow Miss Moisture Body Wash', '2026-06-08', 57592.00, 30),
    ('P0069', 'B0015', 'The Bath Box Brassica Lightening Facial Serum', '2024-09-04', 158000.00, 17),
    ('P0070', 'B0015', 'The Bath Box Goats Dont Lie', '2025-12-12', 166000.00, 23),
    ('P0071', 'B0015', 'The Bath Box Salted Honey Facial Cleanser', '2025-07-14', 179000.00, 21),
    ('P0072', 'B0015', 'The Bath Box Ocha Liquid Soap', '2026-05-22', 129000.00, 32),
    ('P0073', 'B0015', 'The Bath Box Veggie Pro Nourishing Shampoo', '2024-03-26', 185000.00, 13);

INSERT INTO Member VALUES
    ('M0001', 'Amanda Sunanto', '1997-10-15', 'amandasusanto@gmail.com', '081228161962', 'Jl. Martapura III No. 4, Tanah Abang, DKI Jakarta', 105),
    ('M0002', 'Deyuri Melfriza', '1999-08-22', 'deyurimelfriza08@gmail.com', '089681429435', 'Jl. Percetakan Negara D 639, DKI Jakarta', 111),
    ('M0003', 'Maida Sudiati', '2001-04-05', 'maidasudiati@gmail.com', '082167739725', 'Jl. Suryo Pranoto 2 Bl B/40, DKI Jakarta', 730),
    ('M0004', 'Tifany Zakia', '1996-12-03', 'zakia03@gmail.com', '085730850479', 'Jl. Gunung Sahari 11 Kecil No. 22, DKI Jakarta', 55),
    ('M0005', 'Almira Satria', '2003-01-29', 'almirasat@gmail.com', '082108997386', 'Jl. Mangga Besar 13 No 22, DKI Jakarta', 73),
    ('M0006', 'Melissa Oktaviani', '2000-07-17', 'melissaokta@gmail.com', '085715452778', 'Jl. Seulawah Raya no. B-3, Kompleks TNI AU Waringin Permai, DKI Jakarta', 151),
    ('M0007', 'Diandra Prapastia', '1998-11-11', 'diandraprapastia@gmail.com', '081285257465', 'Jl. Cempaka Putih Barat Raya No. 6A, DKI Jakarta', 486),
    ('M0008', 'Nella Rompas', '1995-09-08', 'nellarommy@gmail.com', '082128249138', 'Jl. Dr. Susilo 1 No.10, Grogol, DKI Jakarta', 14),
    ('M0009', 'Muning Amsamsyum', '2004-03-12', 'muningsyum@gmail.com', '089689525963', 'Jl. Letjen Suprapto, Jakarta Pusat, DKI Jakarta', 557);

INSERT INTO Customer VALUES
    ('C0001', '082167739725', NULL),
    ('C0002', '087787145112', NULL),
    ('C0003', '083137497380', NULL),
    ('C0004', '087769138879', NULL),
    ('C0005', '085747023860', NULL),
    ('C0006', '085782814504', NULL),
    ('C0007', '085747546770', NULL),
    ('C0008', '085794709511', NULL),
    ('C0009', '081203196023', NULL),
    ('C0010', '081218075334', NULL),
    ('C0011', '081278109810', NULL),
    ('C0012', '082136808257', NULL),
    ('C0013', '082132132499', NULL),
    ('C0014', '083134766561', NULL),
    ('C0015', '083109451594', NULL),
    ('C0016', '082149830047', NULL),
    ('C0017', '082112160390', NULL),
    ('C0018', '088719400406', NULL),
    ('C0019', '088732311162', NULL),
    ('C0020', '083199652492', NULL),
    ('C0021', '082184881754', NULL),
    ('C0022', '081271838985', NULL),
    ('C0023', '089689525963', NULL),
    ('C0024', '089696081921', NULL),
    ('C0025', '089681429435', NULL),
    ('C0026', '081227019736', NULL),
    ('C0027', '085730850479', NULL),
    ('C0028', '085765452642', NULL),
    ('C0029', '081228161962', NULL),
    ('C0030', '081246614367', NULL),
    ('C0031', '087883191543', NULL),
    ('C0032', '087834096159', NULL),
    ('C0033', '082108997386', NULL),
    ('C0034', '082161918612', NULL),
    ('C0035', '082146404817', NULL),
    ('C0036', '082128249138', NULL),
    ('C0037', '082177513714', NULL),
    ('C0038', '087896018579', NULL),
    ('C0039', '087870044304', NULL),
    ('C0040', '081285257465', NULL),
    ('C0041', '085745951236', NULL),
    ('C0042', '085715452778', NULL),
    ('C0043', '081145263548', NULL),
    ('C0044', '081328184822', NULL),
    ('C0045', '083854608400', NULL),
    ('C0046', '081234567890', NULL),
    ('C0047', '082345678901', NULL),
    ('C0048', '083456789012', NULL),
    ('C0049', '084567890123', NULL),
    ('C0050', '085678901234', NULL),
    ('C0051', '086789012345', NULL),
    ('C0052', '087890123456', NULL),
    ('C0053', '088901234567', NULL),
    ('C0054', '089012345678', NULL),
    ('C0055', '081123456789', NULL);

UPDATE Customer SET Member_IDMember = 'M0001' WHERE IDCust = 'C0004';
UPDATE Customer SET Member_IDMember = 'M0002' WHERE IDCust = 'C0008';
UPDATE Customer SET Member_IDMember = 'M0003' WHERE IDCust = 'C0013';
UPDATE Customer SET Member_IDMember = 'M0004' WHERE IDCust = 'C0024';
UPDATE Customer SET Member_IDMember = 'M0005' WHERE IDCust = 'C0035';
UPDATE Customer SET Member_IDMember = 'M0006' WHERE IDCust = 'C0037';
UPDATE Customer SET Member_IDMember = 'M0007' WHERE IDCust = 'C0045';
UPDATE Customer SET Member_IDMember = 'M0008' WHERE IDCust = 'C0048';
UPDATE Customer SET Member_IDMember = 'M0009' WHERE IDCust = 'C0052';

INSERT INTO Staff VALUES
    ('S0001', 'Fauzia Saputri', '1997-09-20', 'fauziasaputri@gmail.com', '082109454348', 'Jl. Tekukur No. 24, Rengas, Bintaro, Tangerang Selatan'),
    ('S0002', 'Adinda Dewi', '1999-03-12', 'adindadewi@gmail.com', '082126402110', 'Komplek Perumahaan Puri Kencana blok K1, Kembangan Selatan, Jakarta'),
    ('S0003', 'Retno Monica', '1996-07-03', 'monicaretno@gmail.com', '082120672534', 'Jalan Pati No.18, Menteng – Jakarta Pusat, DKI Jakarta'),
    ('S0004', 'Ghina Farishy', '2002-05-18', 'ghinachinggu@gmail.com', '082196407442', 'Jl. Gunung Sahari 11 Kecil No. 40, RT 3 RW 3, Jakarta Pusat'),
    ('S0005', 'Rifanny Manar', '1998-11-30', 'rifanny.mamar@gmail.com', '082187739380', 'Jl. Legoso Raya No.57, Pisangan, Kec. Ciputat Timur, Kota Tangerang Selatan'),
    ('S0006', 'Putri Atsila', '2003-02-25', 'putrisila@gmail.com', '082192745713', 'Jl. Gondang, RT.003/RW.005, Mustikajaya, Bekasi, Jawa Barat'),
    ('S0007', 'Ferani Larascaesara', '2001-08-10', 'feranisara@gmail.com', '087721501943', 'Jl. Siaga V/26 Cempaka Baru – Cempaka Putih, Jakarta Pusat'),
    ('S0008', 'Agustina Ramadani', '1995-12-05', 'agustina22@gmail.com', '087746564569', 'Jl. Rawa Selatan IV 3-7, Jakarta Pusat, DKI Jakarta'),
    ('S0009', 'Choirunnisa Oktafiyanti', '2000-06-28', 'oktafiyanti@gmail.com', '087761872078', 'Jl. Radio V No.4, RT.2/RW.4, Kramat Pela, DKI Jakarta'),
    ('S0010', 'Puspa Yuliasti', '2004-01-15', 'yuliapuspa@gmail.com', '088135270303', 'Jl. Jombang Rawa Lele No.5, Jombang, Kec. Ciputat, Kota Tangerang Selatan'),
    ('S0011', 'Jihaan Hafizh', '1997-04-22', 'jihaanhafizh@gmail.com', '088153799983', 'Jl. Pejambon V No. 4, Gambir, DKI Jakarta'),
    ('S0012', 'Pratiwi Pangestu', '2003-09-08', 'pratiwipange@gmail.com', '088133118689', 'BSD City, Foresta, Studento, L10/10, Pagedangan, Kec. Pagedangan, Kabupaten Tangerang'),
    ('S0013', 'Ries Saraswati', '1999-11-03', 'ries.saraswati@gmail.com', '081230218748', 'Jl. Wibawa Mukti 2, Bekasi Barat, Bekasi, Jawa Barat'),
    ('S0014', 'Septi Marwah', '1996-02-14', 'septimarwah@gmail.com', '081281281504', 'Jl. Cibeber 1 No.17, Rawa Barat, Kebayoran Baru, DKI Jakarta'),
    ('S0015', 'Rofiqotul Ruslian', '2002-07-07', 'ruslianqotul@gmail.com', '081257347202', 'Jl. Bougenville Jakapermai Kranji Bekasi, Bekasi, Jawa Barat');

--Insert Transaksi dan DetailTransaksi (Dummy Data)
INSERT INTO Transaksi VALUES
    ('T0001', 'C0001', 'S0007', '2023-06-07 11:58:36', 351698.00),
    ('T0002', 'C0002', 'S0007', '2023-06-07 12:43:21', 275000.00),
    ('T0003', 'C0003', 'S0007', '2023-06-07 13:18:57', 150000.00),
    ('T0004', 'C0004', 'S0007', '2023-06-07 15:07:49', 605000.00),
    ('T0005', 'C0005', 'S0007', '2023-06-07 20:35:42', 230000.00),
    ('T0006', 'C0006', 'S0007', '2023-06-07 20:50:31', 477106.00),
    ('T0007', 'C0007', 'S0007', '2023-06-07 21:24:59', 249500.00),
    ('T0008', 'C0008', 'S0012', '2023-06-08 10:24:53', 506000.00),
    ('T0009', 'C0009', 'S0012', '2023-06-08 11:56:28', 204600.00),
    ('T0010', 'C0010', 'S0013', '2023-06-08 16:39:59', 465590.00),
    ('T0011', 'C0011', 'S0013', '2023-06-08 17:48:36', 145000.00),
    ('T0012', 'C0012', 'S0013', '2023-06-08 19:15:07', 281085.00),
    ('T0013', 'C0013', 'S0008', '2023-06-08 21:10:19', 1026859.00),
    ('T0014', 'C0014', 'S0008', '2023-06-09 10:32:55', 277788.00),
    ('T0015', 'C0015', 'S0008', '2023-06-09 13:21:43', 170000.00),
    ('T0016', 'C0016', 'S0008', '2023-06-09 15:47:02', 86000.00),
    ('T0017', 'C0017', 'S0008', '2023-06-09 18:34:19', 277950.00),
    ('T0018', 'C0018', 'S0002', '2023-06-10 10:13:08', 203500.00),
    ('T0019', 'C0019', 'S0002', '2023-06-10 11:25:59', 295000.00),
    ('T0020', 'C0020', 'S0002', '2023-06-10 15:46:51', 220000.00),
    ('T0021', 'C0021', 'S0005', '2023-06-10 16:53:42', 260328.00),
    ('T0022', 'C0022', 'S0006', '2023-06-10 19:45:18', 104000.00),
    ('T0023', 'C0023', 'S0001', '2023-06-10 20:58:46', 137000.00),
    ('T0024', 'C0024', 'S0001', '2023-06-11 10:11:34', 555892.00),
    ('T0025', 'C0025', 'S0001', '2023-06-11 12:45:21', 220000.00),
    ('T0026', 'C0026', 'S0001', '2023-06-11 13:55:17', 54400.00),
    ('T0027', 'C0027', 'S0015', '2023-06-11 15:27:39', 305800.00),
    ('T0028', 'C0028', 'S0015', '2023-06-11 18:23:52', 233100.00),
    ('T0029', 'C0029', 'S0015', '2023-06-11 21:04:09', 184875.00),
    ('T0030', 'C0030', 'S0015', '2023-06-12 10:45:57', 495000.00),
    ('T0031', 'C0031', 'S0015', '2023-06-12 11:54:18', 198000.00),
    ('T0032', 'C0032', 'S0015', '2023-06-12 14:36:43', 362000.00),
    ('T0033', 'C0033', 'S0014', '2023-06-12 17:08:32', 113606.00),
    ('T0034', 'C0034', 'S0014', '2023-06-12 19:59:05', 84000.00),
    ('T0035', 'C0035', 'S0014', '2023-06-12 21:18:59', 573729.00),
    ('T0036', 'C0036', 'S0014', '2023-06-13 10:22:40', 179000.00),
    ('T0037', 'C0037', 'S0014', '2023-06-13 11:35:29', 651732.00),
    ('T0038', 'C0038', 'S0014', '2023-06-13 14:17:45', 405500.00),
    ('T0039', 'C0039', 'S0004', '2023-06-13 15:58:53', 248894.00),
    ('T0040', 'C0040', 'S0004', '2023-06-13 17:26:18', 145000.00),
    ('T0041', 'C0041', 'S0004', '2023-06-13 19:50:59', 154000.00),
    ('T0042', 'C0042', 'S0004', '2023-06-13 20:57:42', 379500.00),
    ('T0043', 'C0043', 'S0004', '2023-06-14 10:44:17', 110000.00),
    ('T0044', 'C0044', 'S0004', '2023-06-14 11:57:35', 331500.00),
    ('T0045', 'C0045', 'S0004', '2023-06-14 14:36:47', 986250.00),
    ('T0046', 'C0046', 'S0011', '2023-06-14 16:43:51', 39000.00),
    ('T0047', 'C0047', 'S0011', '2023-06-14 18:15:09', 230000.00),
    ('T0048', 'C0048', 'S0002', '2023-06-14 21:05:23', 165000.00),
    ('T0049', 'C0049', 'S0002', '2023-06-15 10:16:48', 514500.00),
    ('T0050', 'C0050', 'S0002', '2023-06-15 12:39:27', 311000.00),
    ('T0051', 'C0051', 'S0002', '2023-06-15 13:45:19', 130000.00),
    ('T0052', 'C0052', 'S0002', '2023-06-15 15:15:37', 1057000.00),
    ('T0053', 'C0053', 'S0002', '2023-06-15 17:57:58', 393500.00),
    ('T0054', 'C0054', 'S0008', '2023-06-15 19:10:24', 49500.00),
    ('T0055', 'C0055', 'S0008', '2023-06-15 21:52:42', 117000.00);

INSERT INTO DetailTransaksi VALUES
    ('D0001', 'T0001', 'P0001', 1, 89000.00),
    ('D0002', 'T0001', 'P0006', 1, 132698.00),
    ('D0003', 'T0001', 'P0021', 2, 130000.00),
    ('D0004', 'T0002', 'P0019', 1, 275000.00),
    ('D0005', 'T0003', 'P0027', 2, 150000.00),
    ('D0006', 'T0004', 'P0061', 1, 220000.00),
    ('D0007', 'T0004', 'P0062', 1, 385000.00),
    ('D0008', 'T0005', 'P0039', 1, 230000.00),
    ('D0009', 'T0006', 'P0013', 2, 90000.00),
    ('D0010', 'T0006', 'P0025', 1, 115500.00),
    ('D0011', 'T0006', 'P0058', 1, 158000.00),
    ('D0012', 'T0006', 'P0009', 1, 113606.00),
    ('D0013', 'T0007', 'P0033', 1, 39500.00),
    ('D0014', 'T0007', 'P0017', 2, 210000.00),
    ('D0015', 'T0008', 'P0007', 2, 506000.00),
    ('D0016', 'T0009', 'P0036', 1, 204600.00),
    ('D0017', 'T0010', 'P0037', 1, 176000.00),
    ('D0018', 'T0010', 'P0049', 1, 132090.00),
    ('D0019', 'T0010', 'P0014', 3, 157500.00),
    ('D0020', 'T0011', 'P0044', 1, 145000.00),
    ('D0021', 'T0012', 'P0048', 1, 111000.00),
    ('D0022', 'T0012', 'P0054', 1, 170085.00),
    ('D0023', 'T0013', 'P0026', 2, 165000.00),
    ('D0024', 'T0013', 'P0022', 2, 187500.00),
    ('D0025', 'T0013', 'P0053', 1, 207000.00),
    ('D0026', 'T0013', 'P0024', 3, 272859.00),
    ('D0027', 'T0013', 'P0060', 1, 194500.00),
    ('D0028', 'T0014', 'P0046', 2, 277788.00),
    ('D0029', 'T0015', 'P0042', 1, 170000.00),
    ('D0030', 'T0016', 'P0030', 1, 86000.00),
    ('D0031', 'T0017', 'P0051', 1, 277950.00),
    ('D0032', 'T0018', 'P0059', 1, 203500.00),
    ('D0033', 'T0019', 'P0072', 1, 129000.00),
    ('D0034', 'T0019', 'P0070', 1, 166000.00),
    ('D0035', 'T0020', 'P0045', 2, 220000.00),
    ('D0036', 'T0021', 'P0032', 1, 49500.00),
    ('D0037', 'T0021', 'P0066', 1, 50400.00),
    ('D0038', 'T0021', 'P0047', 1, 160428.00),
    ('D0039', 'T0022', 'P0064', 2, 104000.00),
    ('D0040', 'T0023', 'P0057', 1, 137000.00),
    ('D0041', 'T0024', 'P0043', 1, 157500.00),
    ('D0042', 'T0024', 'P0067', 2, 106800.00),
    ('D0043', 'T0024', 'P0040', 2, 234000.00),
    ('D0044', 'T0024', 'P0068', 1, 57592.00),
    ('D0045', 'T0025', 'P0056', 2, 220000.00),
    ('D0046', 'T0026', 'P0065', 1, 54400.00),
    ('D0047', 'T0027', 'P0063', 1, 305800.00),
    ('D0048', 'T0028', 'P0055', 3, 233100.00),
    ('D0049', 'T0029', 'P0050', 1, 184875.00),
    ('D0050', 'T0030', 'P0073', 2, 370000.00),
    ('D0051', 'T0030', 'P0038', 1, 125000.00),
    ('D0052', 'T0031', 'P0002', 2, 198000.00),
    ('D0053', 'T0032', 'P0035', 3, 87000.00),
    ('D0054', 'T0032', 'P0069', 1, 158000.00),
    ('D0055', 'T0032', 'P0011', 3, 117000.00),
    ('D0056', 'T0033', 'P0009', 1, 113606.00),
    ('D0057', 'T0034', 'P0016', 1, 84000.00),
    ('D0058', 'T0035', 'P0010', 1, 65000.00),
    ('D0059', 'T0035', 'P0005', 2, 291104.00),
    ('D0060', 'T0035', 'P0012', 1, 35000.00),
    ('D0061', 'T0035', 'P0015', 1, 75000.00),
    ('D0062', 'T0035', 'P0034', 1, 37500.00),
    ('D0063', 'T0035', 'P0029', 1, 70125.00),
    ('D0064', 'T0036', 'P0071', 1, 179000.00),
    ('D0065', 'T0037', 'P0018', 3, 124500.00),
    ('D0066', 'T0037', 'P0028', 2, 165000.00),
    ('D0067', 'T0037', 'P0008', 1, 243232.00),
    ('D0068', 'T0037', 'P0004', 1, 119000.00),
    ('D0069', 'T0038', 'P0031', 2, 107000.00),
    ('D0070', 'T0038', 'P0003', 2, 98000.00),
    ('D0071', 'T0038', 'P0020', 1, 163000.00),
    ('D0072', 'T0038', 'P0034', 1, 37500.00),
    ('D0073', 'T0039', 'P0056', 1, 110000.00),
    ('D0074', 'T0039', 'P0046', 1, 138894.00),
    ('D0075', 'T0040', 'P0044', 1, 145000.00),
    ('D0076', 'T0041', 'P0035', 1, 29000.00),
    ('D0077', 'T0041', 'P0038', 1, 125000.00),
    ('D0078', 'T0042', 'P0037', 1, 176000.00),
    ('D0079', 'T0042', 'P0059', 1, 203500.00),
    ('D0080', 'T0043', 'P0056', 1, 110000.00),
    ('D0081', 'T0044', 'P0027', 1, 75000.00),
    ('D0082', 'T0044', 'P0053', 1, 207000.00),
    ('D0083', 'T0044', 'P0032', 1, 49500.00),
    ('D0084', 'T0045', 'P0001', 2, 178000.00),
    ('D0085', 'T0045', 'P0042', 1, 170000.00),
    ('D0086', 'T0045', 'P0053', 1, 207000.00),
    ('D0087', 'T0045', 'P0022', 1, 93750.00),
    ('D0088', 'T0045', 'P0070', 1, 166000.00),
    ('D0089', 'T0045', 'P0004', 1, 119000.00),
    ('D0090', 'T0045', 'P0014', 1, 52500.00),
    ('D0091', 'T0046', 'P0011', 1, 39000.00),
    ('D0092', 'T0047', 'P0039', 1, 230000.00),
    ('D0093', 'T0048', 'P0026', 2, 165000.00),
    ('D0094', 'T0049', 'P0069', 1, 158000.00),
    ('D0095', 'T0049', 'P0013', 3, 135000.00),
    ('D0096', 'T0049', 'P0003', 2, 98000.00),
    ('D0097', 'T0049', 'P0016', 1, 84000.00),
    ('D0098', 'T0049', 'P0033', 1, 39500.00),
    ('D0099', 'T0050', 'P0044', 1, 145000.00),
    ('D0100', 'T0050', 'P0070', 1, 166000.00),
    ('D0101', 'T0051', 'P0010', 2, 130000.00),
    ('D0102', 'T0052', 'P0072', 3, 387000.00),
    ('D0103', 'T0052', 'P0061', 1, 220000.00),
    ('D0104', 'T0052', 'P0026', 2, 165000.00),
    ('D0105', 'T0052', 'P0038', 1, 138000.00),
    ('D0106', 'T0052', 'P0003', 3, 147000.00),
    ('D0107', 'T0053', 'P0072', 2, 258000.00),
    ('D0108', 'T0053', 'P0014', 1, 52500.00),
    ('D0109', 'T0053', 'P0018', 2, 83000.00),
    ('D0110', 'T0054', 'P0032', 1, 49500.00),
    ('D0111', 'T0055', 'P0040', 1, 117000.00);

--Display Tabel
SELECT * FROM Brand;
SELECT * FROM Produk;
SELECT * FROM Member;
SELECT * FROM Customer ORDER BY IDCust ASC;
SELECT * FROM Staff;
SELECT * FROM Transaksi ORDER BY IDTransaksi ASC;
SELECT * FROM DetailTransaksi ORDER BY IDDetailTransaksi ASC;