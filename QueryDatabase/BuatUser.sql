-- Hak Akses Users
CREATE USER tokomember WITH ENCRYPTED PASSWORD 'member123';
CREATE USER tokoadmin WITH ENCRYPTED PASSWORD 'admin123';
CREATE USER tokostaff WITH ENCRYPTED PASSWORD 'staff123';


-- Role
CREATE ROLE admin_role;
CREATE ROLE member_role;
CREATE ROLE staff_role;

-- Admin
GRANT admin_role TO tokoadmin;
GRANT SELECT, INSERT, UPDATE ON Customer, Transaksi, DetailTransaksi, Produk, Brand, Member TO admin_role;


-- Staff
GRANT staff_role TO tokostaff;
GRANT SELECT, INSERT, UPDATE ON Customer, Transaksi, DetailTransaksi TO staff_role;
GRANT SELECT ON MEMBER TO staff_role;

-- Member
GRANT member_role TO tokomember;
GRANT SELECT ON MEMBER TO member_role;
