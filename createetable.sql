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

CREATE TABLE Customer(
    IDCust CHAR(5) PRIMARY KEY NOT NULL,
    Nama VARCHAR(75) NOT NULL,
    Email VARCHAR(30) NOT NULL,
    NoTelp VARCHAR(15) NOT NULL,
    Alamat VARCHAR(100) NOT NULL
);

CREATE TABLE Staff(
    IDStaff CHAR(5) PRIMARY KEY NOT NULL,
    Nama VARCHAR(75) NOT NULL,
    TanggalLahir DATE NOT NULL,
    Email VARCHAR(30) NOT NULL,
    NoTelp VARCHAR(15) NOT NULL,
    Alamat VARCHAR(100) NOT NULL
);

DROP TABLE Staff;
DROP TABLE Transaksi;
DROP TABLE DetailTransaksi;

CREATE TABLE Transaksi(
    IDTransaksi CHAR(5) PRIMARY KEY NOT NULL,
	Customer_IDCust CHAR(5) NOT NULL,
	Staff_IDStaff CHAR(5) NOT NULL,
    Tanggal TIMESTAMP DEFAULT NOW() NOT NULL,
    TotalHarga NUMERIC(10,2) NOT NULL
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
	Produk_IDProduk CHAR(5) NOT NULL,
    Jumlah INTEGER NOT NULL,
    TotalHarga NUMERIC(10,2) NOT NULL
);

ALTER TABLE DetailTransaksi
ADD CONSTRAINT IDTransaksi_DetailTransaksi
FOREIGN KEY(Transaksi_IDTransaksi)
REFERENCES Transaksi(IDTransaksi);

ALTER TABLE DetailTransaksi
ADD CONSTRAINT IDProduk_DetailTransaksi
FOREIGN KEY(Produk_IDProduk)
REFERENCES Produk(IDProduk);

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
	

INSERT INTO Customer VALUES
    ('C0001', 'Maida Sudiati', 'maidasudiati@gmail.com', '082167739725', 'Jl. Suryo Pranoto 2 Bl B/40, DKI Jakarta'),
    ('C0002', 'Dewi Mandasari', 'dewim123@gmail.com', '087787145112', 'Jl. Ploso Bogen 36 A, Jawa Timur'),
    ('C0003', 'Kani Novitasari', 'kaninov@gmail.com', '083137497380', 'Jl. Bendungan Hilir Raya 33 A, DKI Jakarta'),
    ('C0004', 'Hani Yuniar', 'haniyuni@gmail.com', '087769138879', 'Jl. Kemang Utr IX 8, DKI Jakarta'),
    ('C0005', 'Banara Utama', 'banara.utama@gmail.com', '085747023860', 'Jl. Banceuy 22, Jawa Barat'),
    ('C0006', 'Jasmin Oktaviani', 'jasminokt@gmail.com', '085782814504', 'Jalan Permata Sari,Melawai 210, DKI Jakarta'),
    ('C0007', 'Artawan Waluyo', 'artawannn@gmail.com', '085747546770', 'Jl. Raden Saleh Raya 4 Dinar Bldg, DKI Jakarta'),
    ('C0008', 'Ani Rahayu', 'anirahayu@gmail.com', '085794709511', 'Jl. Kebahagiaan 23, DKI Jakarta'),
    ('C0009', 'Mala Lailasari', 'mala765@gmail.com', '081203196023', 'Jl. Cideng Brt 62 B, DKI Jakarta'),
    ('C0010', 'Hasna Widiastuti', 'hasnaaw@gmail.com', '081218075334', 'Jl. Trunojoyo 3, DKI Jakarta'),
    ('C0011', 'Ajeng Nuraini', 'ajengnur@gmail.com', '081278109810', 'Jl. Mesjid Raya 18 RT 001/07 Peninggilan Larangan Slt Tangera, DKI Jakarta'),
    ('C0012', 'Heru Latupono', 'heru.latupono@gmail.com', '082136808257', 'Jl. Mangga Dua Raya Bl N/21, DKI Jakarta'),
    ('C0013', 'Shakila Wijayanti', 'shakilawijaya@gmail.com', '082132132499', 'Jl. Mangga Dua Raya Psr Pagi Mangga Dua Bl A/188, DKI Jakarta'),
    ('C0014', 'Nrima Ramadan', 'ramadani@gmail.com', '083134766561', 'Jl. Raya Pintu I TMII Kav 7, Jakarta'),
    ('C0015', 'Laswi Uwais', 'laswiuwaw@gmail.com', '083109451594', 'Jl. Lingkar Slt 5, Jawa Barat'),
    ('C0016', 'Juli Hasanah', 'julihasanah@gmail.com', '082149830047', 'Jl. Hayam Wuruk V Glodok Baru Harco Bl D II/1, Dki Jakarta'),
    ('C0017', 'Icha Hasanah', 'ichaicha@gmail.com', '082112160390', 'Jl. Alur Laut I 43 RT 004/03 Perum Pelabuhan, DKI Jakarta'),
    ('C0018', 'Ulva Hariyah', 'ulvavv123@gmail.com', '088719400406', 'Jl. Tmn Nyiur Bl N/3 B, DKI Jakarta'),
    ('C0019', 'Prayitna Firgantoro', 'pritaaafir@gmail.com', '088732311162', 'Jl. Raya Bekasi Km 26/99, DKI Jakarta'),
    ('C0020', 'Atmaja Lazuardi', 'majardi@gmail.com', '083199652492', 'Psr Tanah Abang Bl C Los BKS/2, DKI Jakarta'),
    ('C0021', 'Hardianti Dewi', 'dewihadrianti@gmail.com', '082184881754', 'Jl. KH Agus Salim 16, Menteng, DKI Jakarta'),
    ('C0022', 'Assalia Agustina', 'assaliaagustina@gmail.com', '081271838985', 'Jl. Cempaka Raya III No 6  DKI Jakarta'),
    ('C0023', 'Muning Amsamsyum', 'muningsyum@gmail.com', '089689525963', 'Jl. Letjen Suprapto, Jakarta Pusat, DKI Jakarta'),
    ('C0024', 'Defara Febrianto', 'defara.febrianto@gmail.com', '089696081921', 'Jl. Setiabudi Tengah No. 3, DKI Jakarta'),
    ('C0025', 'Deyuri Melfriza', 'deyurimelfriza08@gmail.com', '089681429435', 'Jl. Percetakan Negara D 639, DKI Jakarta'),
    ('C0026', 'Fauzia Mustikawati', 'fauziamustikawati@gmail.com', '081227019736', 'Duta Merlin, Blok B / 37, Gambir, DKI Jakarta'),
    ('C0027', 'Tifany Zakia', 'zakia03@gmail.com', '085730850479', 'Jl. Gunung Sahari 11 Kecil No. 22, DKI Jakarta'),
    ('C0028', 'Dwi Hapsari', 'taman.hapsari@gmail.com', '085765452642', 'Jl.Tebet Barat Dalam II.F, Tebet, DKI Jakarta'),
    ('C0029', 'Amanda Sunanto', 'amandasusanto@gmail.com', '081228161962', 'Jl. Martapura III No. 4, Tanah Abang, DKI Jakarta'),
    ('C0030', 'Dessita Ramadhan', 'dessita666@gmail.com', '081246614367', 'Jl. Gading Elok, Kelapa Gading, DKI Jakarta'),
    ('C0031', 'Ajeng Setyawati', 'ajengwati@gmail.com', '087883191543', 'Jl. Bonang No. 19. RT 2/RW 5, DKI Jakarta'),
    ('C0032', 'Hilyah Nugraha', 'nugrahaiyah@gmail.com', '087834096159', 'Jl. Gunung Sahari XI No. 24, DKI Jakarta'),
    ('C0033', 'Almira Satria', 'almirasat@gmail.com', '082108997386', 'Jl. Mangga Besar 13 No 22, DKI Jakarta'),
    ('C0034', 'Shabrina Zwestyningrum', 'nignrumshabrina@gmail.com', '082161918612', 'Jl. Kramat Jaya Baru 3 No. 14, DKI Jakarta'),
    ('C0035', 'Widya Oktavia', 'widyaokto@gmail.com', '082146404817', 'Jl. Jalak Suren Blok C No. 41, Bekasi'),
    ('C0036', 'Nella Rompas', 'nellarommy@gmail.com', '082128249138', 'Jl. Dr. Susilo 1 No.10, Grogol, DKI Jakarta'),
    ('C0037', 'Frisca Candraditya', 'friscaaditya@gmail.com', '082177513714', 'Jl. Mamur Raya Blk. C1 No.1, Bekasi'),
    ('C0038', 'Nita Qosthory', 'qosthoryta@gmail.com', '087896018579', 'Jl. Kramat Asem Raya No. 3, DKI Jakarta'),
    ('C0039', 'Yenny Rafles', 'yenny.rafles@gmail.com', '087870044304', 'Jl. Kramat Soka, Kramat, DKI Jakarta'),
    ('C0040', 'Diandra Prapastia', 'diandraprapastia@gmail.com', '081285257465', 'Jl. Cempaka Putih Barat Raya No. 6A, DKI Jakarta'),
    ('C0041', 'Nadya Putri Kamala', 'nadyaputri31@gmail.com', '085745951236', 'Jl. Dwi Warna 4, No. 9B, DKI Jakarta'),
    ('C0042', 'Melissa Oktaviani', 'melissaokta@gmail.com', '085715452778', 'Jl. Seulawah Raya no. B-3, Kompleks TNI AU Waringin Permai, DKI Jakarta'),
    ('C0043', 'Putri Aini Shihab', 'putrishihab@gmail.com', '081145263548', 'Jl. Kemuning Raya No. 1 RT/RW 012/02 Utan Kayu Utara, DKI Jakarta'),
    ('C0044', 'Seravin Suteja', 'seravinsuteja@gmail.com', '081328184822', 'Jl. Percetakan Negara 1 no. 1 RT 02 RW 07, Johar Baru, DKI Jakarta'),
    ('C0045', 'Abigail Sinaga', 'abigailsinaga@gmail.com', '083854608400', 'Jl. Tekukur No. 24, Rengas, Bintaro, Tangerang Selatan');


INSERT INTO Staff VALUES
    ('S0001', 'Fauzia Saputri', 'fauziasaputri@gmail.com', '082109454348', 'Jl. Tekukur No. 24, Rengas, Bintaro, Tangerang Selatan'),
    ('S0002', 'Adinda Dewi', 'adindadewi@gmail.com', '082126402110', 'Komplek Perumahaan Puri Kencana blok K1, Kembangan Selatan, Jakarta'),
    ('S0003', 'Retno Monica', 'monicaretno@gmail.com', '082120672534', 'Jalan Pati No.18, Menteng – Jakarta Pusat, DKI Jakarta'),
    ('S0004', 'Ghina Farishy', 'ghinachinggu@gmail.com', '082196407442', 'Jl. Gunung Sahari 11 Kecil No. 40, RT 3 RW 3, Jakarta Pusat'),
    ('S0005', 'Rifanny Manar', 'rifanny.mamar@gmail.com', '082187739380', 'Jl. Legoso Raya No.57, Pisangan, Kec. Ciputat Timur, Kota Tangerang Selatan'),
    ('S0006', 'Putri Atsila', 'putrisila@gmail.com', '082192745713', 'Jl. Gondang, RT.003/RW.005, Mustikajaya, Bekasi, Jawa Barat'),
    ('S0007', 'Ferani Larascaesara', 'feranisara@gmail.com', '087721501943', 'Jl. Siaga V/26 Cempaka Baru – Cempaka Putih, Jakarta Pusat'),
    ('S0008', 'Agustina Ramadani', 'agustina22@gmail.com', '087746564569', 'Jl. Rawa Selatan IV 3-7, Jakarta Pusat, DKI Jakarta'),
    ('S0009', 'Choirunnisa Oktafiyanti', 'oktafiyanti@gmail.com', '087761872078', 'Jl. Radio V No.4, RT.2/RW.4, Kramat Pela, DKI Jakarta'),
    ('S0010', 'Puspa Yuliasti', 'yuliapuspa@gmail.com', '088135270303', 'Jl. Jombang Rawa Lele No.5, Jombang, Kec. Ciputat, Kota Tangerang Selatan'),
    ('S0011', 'Jihaan Hafizh', 'jihaanhafizh@gmail.com', '088153799983', 'Jl. Pejambon V No. 4, Gambir, DKI Jakarta'),
    ('S0012', 'Pratiwi Pangestu', 'pratiwipange@gmail.com', '088133118689', 'BSD City, Foresta, Studento, L10/10, Pagedangan, Kec. Pagedangan, Kabupaten Tangerang'),
    ('S0013', 'Ries Saraswati', 'ries.saraswati@gmail.com', '081230218748', 'Jl. Wibawa Mukti 2, Bekasi Barat, Bekasi, Jawa Barat'),
    ('S0014', 'Septi Marwah', 'septimarwah@gmail.com', '081281281504', 'Jl. Cibeber 1 No.17, Rawa Barat, Kebayoran Baru, DKI Jakarta'),
    ('S0015', 'Rofiqotul Ruslian', 'ruslianqotul@gmail.com', '081257347202', 'Jl. Bougenville Jakapermai Kranji Bekasi, Bekasi, Jawa Barat');

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


SELECT * FROM staff;
