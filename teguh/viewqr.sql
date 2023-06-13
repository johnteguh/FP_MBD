-- View untuk menampilkan banyak produk yang dibeli setiap transaksi

CREATE VIEW Total_Pertransaksi AS
SELECT tr.idtransaksi, COUNT(td.transaksi_IDTransaksi) AS jumlah_produk
FROM DetailTransaksi td, Transaksi tr
WHERE td.transaksi_IDTransaksi = tr.idtransaksi
GROUP BY tr.idtransaksi
ORDER BY tr.idtransaksi ASC;

SELECT * FROM Total_Pertransaksi;
