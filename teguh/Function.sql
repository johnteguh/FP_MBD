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