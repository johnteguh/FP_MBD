-- View untuk menampilkan banyak produk yang dibeli setiap transaksi
CREATE VIEW Total_Pertransaksi AS
SELECT t.IDTransaksi, COUNT(dt.IDDetailTransaksi) AS "Jumlah Produk", SUM(dt.Jumlah) AS "Jumlah Total"
FROM Transaksi t
INNER JOIN DetailTransaksi dt ON t.IDTransaksi = dt.Transaksi_IDTransaksi
GROUP BY t.IDTransaksi
ORDER BY t.IDTransaksi ASC;

SELECT * FROM total_pertransaksi;


-- View untuk menampilkan produk yang memiliki harga diatas rata-rata
CREATE VIEW PRODUK_MAHAL AS
SELECT IDProduk, NAMA, HARGA
FROM PRODUK
WHERE HARGA > (SELECT AVG(HARGA) FROM PRODUK);

SELECT * FROM PRODUK_MAHAL;
