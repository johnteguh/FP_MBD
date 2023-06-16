
--Membuat User Member yang hanya bisa SELECT table Member
CREATE USER Member_toko WITH ENCRYPTED PASSWORD 'password';
GRANT CONNECT ON DATABASE TokoKosmetik TO Member_toko;
GRANT SELECT ON MEMBER TO Member_toko;
