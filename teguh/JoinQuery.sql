
-- menampilkan idtransaksinya dengan iddetailtransaksinya
SELECT t.IDTransaksi, d.IDDetailTransaksi
FROM Transaksi t
JOIN DetailTransaksi d ON t.IDTransaksi = d.Transaksi_IDTransaksi
ORDER BY t.idtransaksi;

--Mendapatkan barang yang memiliki nama character SPF di nama produknya dan memiliki character 'O' di brand
SELECT b.NAMA AS "Brand",p.NAMA AS "Produk" FROM PRODUK p
INNER JOIN BRAND b ON p.BRAND_IDBRAND = b.IDBRAND
WHERE p.NAMA LIKE '%SPF%' AND b.nama LIKE '%O%';