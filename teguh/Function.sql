CREATE OR REPLACE FUNCTION get_members_by_birthmonth(input_month INTEGER)
RETURNS TABLE (Member_IDMember CHAR(5), Nama_Member VARCHAR(50), TanggalLahir_Member DATE) AS $$
BEGIN
    RETURN QUERY
    SELECT IDMember, Nama, TanggalLahir
    FROM Member
    WHERE EXTRACT(MONTH FROM TanggalLahir) = input_month;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM get_members_by_birthmonth(6);

--
CREATE OR REPLACE FUNCTION get_products_by_price(input_price NUMERIC)
RETURNS TABLE (IDProduk CHAR(5), Nama VARCHAR(150), Stok INTEGER, Harga NUMERIC(8,2)) AS $$
BEGIN
    RETURN QUERY
    SELECT IDProduk, Nama, Stok, Harga
    FROM Produk
    WHERE Harga < input_price;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM get_products_by_price(500000.00);

--
CREATE OR REPLACE FUNCTION get_products_by_pricestok(input_price NUMERIC, input_stok INTEGER)
RETURNS TABLE (ID_Produk CHAR(5), Nama_Produk VARCHAR(150), Stok_Produk INTEGER, Harga_Produk NUMERIC(8,2)) AS $$
BEGIN
    RETURN QUERY
    SELECT IDProduk, Nama, Stok, Harga
    FROM Produk
    WHERE Harga < input_price AND Stok < input_stok;
END;
$$ LANGUAGE plpgsql;
