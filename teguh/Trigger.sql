-- Trigger untuk menambahkah Idmember di tabel customer bila terdapat nomor yang sama dengan NoTelp di tabel member
CREATE OR REPLACE FUNCTION check_and_insert_idmember()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.NoTelp IS NOT NULL THEN
        UPDATE Customer
        SET IDMember = (SELECT IDMember FROM Member WHERE NoTelp = NEW.NoTelp)
        WHERE IDCust = NEW.IDCust;
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER insert_idmember_trigger
AFTER INSERT ON Customer
FOR EACH ROW
EXECUTE FUNCTION check_and_insert_idmember();

--Trigger untuk mencatat bila terjadi update stok pada produk dengan mencatat penambahan atau pengurangan barangnya

CREATE TABLE log_produk
(
    logid SERIAL PRIMARY KEY,
    activity VARCHAR(100),
    idProduk CHAR(5),
    jumlah integer,
    starttime TIMESTAMP DEFAULT NOW()
);

CREATE OR REPLACE FUNCTION log_produk_changes()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.stok > OLD.stok THEN
        INSERT INTO log_produk(activity, idproduk,jumlah)
        VALUES ('Menambah Stok', NEW.idproduk,NEW.stok - OLD.stok);
    ELSIF NEW.stok < OLD.stok THEN
        INSERT INTO log_produk(activity, idproduk,jumlah)
        VALUES ('Mengurangi Stok', NEW.idproduk,OLD.stok - NEW.stok);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER produk_stok_trigger
AFTER UPDATE OF stok ON produk
FOR EACH ROW
EXECUTE FUNCTION log_produk_changes();



--error / salah
-- Trigger untuk melakukan diskon 10% apabila tanggal transaksi sama dengan tanggal lahirnya
CREATE OR REPLACE FUNCTION apply_discount()
RETURNS TRIGGER AS $$
DECLARE
    member_id CHAR(5);
    member_dob DATE;
    hargabaru NUMERIC(10,2);
BEGIN
    SELECT IDMember INTO member_id
    FROM Customer
    WHERE IDCust = NEW.Customer_IDCust;

    RAISE NOTICE 'ID membernya : %', member_id;

    IF member_id IS NOT NULL THEN
        SELECT TanggalLahir INTO member_dob
        FROM Member
        WHERE IDMember = member_id;

        RAISE NOTICE 'TanggalLahir: %, Tanggal Baru: %', member_dob, NEW.Tanggal;

        IF member_dob = DATE_TRUNC('day', NEW.Tanggal)::DATE THEN
            NEW.TotalHarga = NEW.TotalHarga * 0.9;
            RAISE NOTICE 'TotalHarga: %', NEW.TotalHarga;
            RAISE NOTICE 'Tanggal sama';
        ELSE
            RAISE NOTICE 'Tanggal berbeda';
        END IF;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER diskon_ultah_trigger
AFTER UPDATE ON Transaksi
FOR EACH ROW
EXECUTE FUNCTION apply_discount();





