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