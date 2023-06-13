-- View untuk menampilkan banyak produk yang dibeli setiap transaksi

CREATE VIEW View_Transaksi_Count AS
SELECT tr.idtransaksi, COUNT(td.transaksi_IDTransaksi) AS jumlah_produk
FROM DetailTransaksi td, Transaksi tr
WHERE td.transaksi_IDTransaksi = tr.idtransaksi
GROUP BY tr.idtransaksi
ORDER BY tr.idtransaksi ASC;

SELECT * FROM View_Transaksi_Count;
