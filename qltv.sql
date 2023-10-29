
CREATE TABLE DGia
(
    MaDGia NVARCHAR2(50) PRIMARY KEY,
    TenDGia NVARCHAR2(50),
    NgaySinhDGia DATE,
    GTinh NUMBER(1,0),
    DChiDGia NVARCHAR2(100),
    TTDGia NUMBER(1,0),
    SDT NVARCHAR2(20)
);

CREATE TABLE id
(
    MaID NVARCHAR2(50) PRIMARY KEY,
    TK NVARCHAR2(50),
    MK NVARCHAR2(50),
    QuyenTC NUMBER,
    TThaiTK NVARCHAR2(50)
);

CREATE TABLE Sach
(
    MaSach NVARCHAR2(50) PRIMARY KEY,
    TenSach NVARCHAR2(100),
    MaLSach NVARCHAR2(50) REFERENCES LSach(MaLSach),
    MaTGia NVARCHAR2(50) REFERENCES TGia(MaTGia),
    MaNXB NVARCHAR2(50) REFERENCES NXB(MaNXB),
    SoLuong NUMBER
);

CREATE TABLE LSach
(
    MaLSach NVARCHAR2(50) PRIMARY KEY,
    TenLSach NVARCHAR2(100)
);

CREATE TABLE NXB
(
    MaNXB NVARCHAR2(50) PRIMARY KEY,
    TenNXB NVARCHAR2(100)
);

CREATE TABLE TGia
(
    MaTGia NVARCHAR2(50) PRIMARY KEY,
    TenTGia NVARCHAR2(100)
);

CREATE TABLE Muon
(
    MaMuon NUMBER PRIMARY KEY,
    MaID NVARCHAR2(50),
    MaSach NVARCHAR2(50),
    MaDGia NVARCHAR2(50),
    NgayMuon DATE,
    SoLuong NUMBER,
    TThaiMuon NUMBER(1,0),
    FOREIGN KEY (MaID) REFERENCES id(MaID),
    FOREIGN KEY (MaSach) REFERENCES Sach(MaSach),
    FOREIGN KEY (MaDGia) REFERENCES DGia(MaDGia)
);


CREATE TABLE Tra
(
    MaTra NUMBER PRIMARY KEY,
    MaMuon NUMBER REFERENCES Muon(MaMuon),
    NgayTra DATE
);
select * from LSach;
//Them du lieu cho cac bang
INSERT INTO LSach (MaLSach, TenLSach)
VALUES ('LS001', 'Ti?u thuy?t');

INSERT INTO LSach (MaLSach, TenLSach)
VALUES ('LS002', 'Khoa h?c');

INSERT INTO LSach (MaLSach, TenLSach)
VALUES ('LS003', 'L?ch s?');
//Tac Gia
INSERT INTO TGia (MaTGia, TenTGia)
VALUES ('TG001', 'Nguy?n Nh?t Ánh');

INSERT INTO TGia (MaTGia, TenTGia)
VALUES ('TG002', 'Ngô T?t T?');

INSERT INTO TGia (MaTGia, TenTGia)
VALUES ('TG003', 'H? Chí Minh');
//NXB
INSERT INTO NXB (MaNXB, TenNXB)
VALUES ('NXB001', 'Nhà xu?t b?n A');

INSERT INTO NXB (MaNXB, TenNXB)
VALUES ('NXB002', 'Nhà xu?t b?n B');

INSERT INTO NXB (MaNXB, TenNXB)
VALUES ('NXB003', 'Nhà xu?t b?n C');
//DGia
INSERT INTO DGia (MaDGia, TenDGia, NgaySinhDGia, GTinh, DChiDGia, TTDGia, SDT)
VALUES ('DG001', 'Nguy?n V?n A', TO_DATE('1990-01-15', 'YYYY-MM-DD'), 1, 'Hà N?i', 1, '0987654321');

INSERT INTO DGia (MaDGia, TenDGia, NgaySinhDGia, GTinh, DChiDGia, TTDGia, SDT)
VALUES ('DG002', 'Nguy?n Th? B', TO_DATE('1985-08-22', 'YYYY-MM-DD'), 0, 'H? Chí Minh', 1, '0978123456');

INSERT INTO DGia (MaDGia, TenDGia, NgaySinhDGia, GTinh, DChiDGia, TTDGia, SDT)
VALUES ('DG003', 'Tr?n V?n C', TO_DATE('2000-05-10', 'YYYY-MM-DD'), 1, '?à N?ng', 0, '0909123456');
//Sach
INSERT INTO Sach (MaSach, TenSach, MaLSach, MaTGia, MaNXB, SoLuong)
VALUES ('S001', 'Ti?u thuy?t A', 'LS001', 'TG001', 'NXB001', 100);

INSERT INTO Sach (MaSach, TenSach, MaLSach, MaTGia, MaNXB, SoLuong)
VALUES ('S002', 'Khoa h?c và cu?c s?ng', 'LS002', 'TG002', 'NXB002', 80);

INSERT INTO Sach (MaSach, TenSach, MaLSach, MaTGia, MaNXB, SoLuong)
VALUES ('S003', 'L?ch s? Vi?t Nam', 'LS003', 'TG003', 'NXB003', 120);

INSERT INTO Sach (MaSach, TenSach, MaLSach, MaTGia, MaNXB, SoLuong)
VALUES ('S004', 'Sách m?i', 'LS001', 'TG001', 'NXB001', 9);

//Tai khoan
INSERT INTO id (MaID, TK, MK, QuyenTC, TThaiTK)
VALUES ('ID001', 'user1', 'password1', 1, 'Active');

INSERT INTO id (MaID, TK, MK, QuyenTC, TThaiTK)
VALUES ('ID002', 'user2', 'password2', 2, 'Active');

INSERT INTO id (MaID, TK, MK, QuyenTC, TThaiTK)
VALUES ('ID003', 'admin', 'adminpassword', 3, 'Active');
//Muon
-- Thêm thông tin m??n sách vào b?ng Muon
INSERT INTO Muon (MaMuon, MaID, MaSach, MaDGia, NgayMuon, SoLuong, TThaiMuon)
VALUES (1, 'ID001', 'S001', 'DG001', TO_DATE('2023-09-30', 'YYYY-MM-DD'), 2, 1);

INSERT INTO Muon (MaMuon, MaID, MaSach, MaDGia, NgayMuon, SoLuong, TThaiMuon)
VALUES (2, 'ID002', 'S002', 'DG002', TO_DATE('2023-10-01', 'YYYY-MM-DD'), 1, 1);

INSERT INTO Muon (MaMuon, MaID, MaSach, MaDGia, NgayMuon, SoLuong, TThaiMuon)
VALUES (3, 'ID003', 'S003', 'DG003', TO_DATE('2023-10-02', 'YYYY-MM-DD'), 3, 1);
-- Thêm thông tin tr? sách vào b?ng Tra
INSERT INTO Tra (MaTra, MaMuon, NgayTra)
VALUES (1, 1, TO_DATE('2023-10-05', 'YYYY-MM-DD'));

INSERT INTO Tra (MaTra, MaMuon, NgayTra)
VALUES (2, 2, TO_DATE('2023-10-06', 'YYYY-MM-DD'));

INSERT INTO Tra (MaTra, MaMuon, NgayTra)
VALUES (3, 3, TO_DATE('2023-10-07', 'YYYY-MM-DD'));

//Hiên thi các b?ng
SELECT * FROM LSach;
SELECT * FROM TGia;
SELECT * FROM NXB;
SELECT * FROM DGia;
SELECT * FROM Sach;
SELECT * FROM id;
SELECT * FROM Muon;
SELECT * FROM Tra;



//Truy v?n c? b?n
SELECT TenDGia FROM DGia;

SELECT Sach.TenSach, TGia.TenTGia 
FROM Sach 
INNER JOIN TGia ON Sach.MaTGia = TGia.MaTGia;

SELECT MaLSach, COUNT(*) AS SoLuongSach 
FROM Sach 
GROUP BY MaLSach;

SELECT Muon.MaMuon, DGia.TenDGia, Sach.TenSach, Muon.NgayMuon 
FROM Muon 
INNER JOIN DGia ON Muon.MaDGia = DGia.MaDGia
INNER JOIN Sach ON Muon.MaSach = Sach.MaSach;

SELECT Sach.TenSach, Muon.NgayMuon 
FROM Muon 
INNER JOIN Sach ON Muon.MaSach = Sach.MaSach
WHERE Muon.MaDGia = 'DG003';

SELECT * FROM Sach WHERE SoLuong < 10;

SELECT MaDGia, COUNT(*) AS TongSoSachMuon 
FROM Muon 
GROUP BY MaDGia;
//Them du lieu
-- Thêm l?n m??n th? nh?t
INSERT INTO Muon (MaMuon, MaID, MaSach, MaDGia, NgayMuon, SoLuong, TThaiMuon)
VALUES (6, 'ID001', 'S004', 'DG001', TO_DATE('2023-10-10', 'YYYY-MM-DD'), 1, 1);

-- Thêm l?n m??n th? hai
INSERT INTO Muon (MaMuon, MaID, MaSach, MaDGia, NgayMuon, SoLuong, TThaiMuon)
VALUES (7, 'ID002', 'S004', 'DG002', TO_DATE('2023-10-12', 'YYYY-MM-DD'), 1, 1);

SELECT Sach.MaSach, TenSach, COUNT(Muon.MaMuon) AS SoLanMuon
FROM Sach
JOIN Muon ON Sach.MaSach = Muon.MaSach
GROUP BY Sach.MaSach, TenSach
ORDER BY COUNT(Muon.MaMuon) DESC
FETCH FIRST 1 ROW ONLY;

SELECT Sach.TenSach, Muon.NgayMuon 
FROM Muon 
INNER JOIN Sach ON Muon.MaSach = Sach.MaSach 
WHERE Muon.MaMuon NOT IN (SELECT MaMuon FROM Tra);
//Truy v?n l?ng nhau
SELECT TenDGia 
FROM DGia 
WHERE MaDGia IN (SELECT MaDGia FROM Muon);

SELECT MaLSach, 
       TenLSach, 
       (SELECT COUNT(*) 
        FROM Sach 
        WHERE Sach.MaLSach = LSach.MaLSach) AS SoLuongMuon
FROM LSach;

SELECT TenSach 
FROM Sach 
WHERE MaSach IN (SELECT MaSach FROM Muon WHERE MaDGia = 'DG003');

SELECT TenDGia 
FROM DGia 
WHERE MaDGia IN (SELECT MaDGia FROM Muon WHERE MaMuon NOT IN (SELECT MaMuon FROM Tra));

SELECT Muon.MaMuon, Muon.MaID, Muon.MaSach, Muon.MaDGia, Muon.NgayMuon, Muon.SoLuong, Muon.TThaiMuon,
       DGia.TenDGia, DGia.NgaySinhDGia, DGia.GTinh, DGia.DChiDGia, DGia.TTDGia, DGia.SDT
FROM Muon
INNER JOIN DGia ON Muon.MaDGia = DGia.MaDGia;

SELECT *
FROM Sach
WHERE SoLuong < (SELECT AVG(SoLuong) FROM Sach);

SELECT TenDGia, 
       (SELECT COUNT(*) 
        FROM Muon 
        WHERE DGia.MaDGia = Muon.MaDGia) AS SoLuongMuon
FROM DGia;

SELECT *
FROM Sach
WHERE MaTGia = 'TG001';

SELECT *
FROM Muon
WHERE MaDGia = 'DG001';

SELECT TenSach, COUNT(*) AS SoLuongMuon
FROM Sach
JOIN Muon ON Sach.MaSach = Muon.MaSach
GROUP BY TenSach
HAVING COUNT(*) = (SELECT MAX(SoLuong) FROM (SELECT COUNT(*) AS SoLuong FROM Muon GROUP BY MaSach));

//Truy van gop nhom
SELECT MaLSach, 
       SUM(SoLuong) AS TongSoLuong 
FROM Sach 
GROUP BY MaLSach;

SELECT MaTGia, 
       AVG(SoLuong) AS TrungBinhSoLuong 
FROM Sach 
GROUP BY MaTGia;

SELECT TTDGia, 
       COUNT(*) AS SoLuongDGia 
FROM DGia 
GROUP BY TTDGia;

SELECT MaDGia, 
       COUNT(*) AS TongSoSachMuon 
FROM Muon 
GROUP BY MaDGia;

SELECT NgayMuon, 
       COUNT(*) AS TongSoSachMuon 
FROM Muon 
GROUP BY NgayMuon;

SELECT LSach.TenLSach, 
       SUM(Sach.SoLuong) AS TongSoLuongMuon 
FROM Sach 
INNER JOIN LSach ON Sach.MaLSach = LSach.MaLSach 
GROUP BY LSach.TenLSach;

SELECT TO_CHAR(NgayMuon, 'Day') AS NgayMuon, 
       COUNT(*) AS SoLuotMuon 
FROM Muon 
GROUP BY TO_CHAR(NgayMuon, 'Day');

SELECT NXB.TenNXB, 
       SUM(Sach.SoLuong) AS TongSoLuong 
FROM Sach 
INNER JOIN NXB ON Sach.MaNXB = NXB.MaNXB 
GROUP BY NXB.TenNXB;

SELECT TGia.TenTGia, 
       COUNT(*) AS TongSoSach 
FROM Sach 
INNER JOIN TGia ON Sach.MaTGia = TGia.MaTGia 
GROUP BY TGia.TenTGia;

SELECT DGia.TenDGia, COUNT(Muon.MaMuon) AS SoLanMuon
FROM DGia
INNER JOIN Muon ON DGia.MaDGia = Muon.MaDGia
GROUP BY DGia.TenDGia
ORDER BY SoLanMuon DESC
FETCH FIRST 1 ROWS ONLY;

SELECT DGia.TenDGia, COUNT(Muon.MaMuon) AS SoLanMuon
FROM DGia
INNER JOIN Muon ON DGia.MaDGia = Muon.MaDGia
GROUP BY DGia.TenDGia
ORDER BY SoLanMuon DESC
FETCH FIRST 5 ROWS ONLY;

SELECT Sach.TenSach, COUNT(Muon.MaMuon) AS SoLanMuon
FROM Sach
INNER JOIN Muon ON Sach.MaSach = Muon.MaSach
GROUP BY Sach.TenSach
ORDER BY SoLanMuon DESC
FETCH FIRST 1 ROWS ONLY;

SELECT TO_CHAR(Months.month, 'MM-YYYY') AS ThangNam, COALESCE(COUNT(Muon.MaMuon), 0) AS SoLanMuon
FROM (
    SELECT TO_DATE('2023-01-01', 'YYYY-MM-DD') + (LEVEL - 1) AS month
    FROM DUAL
    CONNECT BY TO_DATE('2023-01-01', 'YYYY-MM-DD') + (LEVEL - 1) <= TO_DATE('2023-12-31', 'YYYY-MM-DD')
) Months
LEFT JOIN Muon ON TO_CHAR(Muon.NgayMuon, 'MM-YYYY') = TO_CHAR(Months.month, 'MM-YYYY')
GROUP BY Months.month
ORDER BY Months.month
FETCH FIRST 5 ROWS ONLY;

SELECT DGia.MaDGia, DGia.TenDGia, COUNT(Muon.MaMuon) AS SoLuongSachMuon
FROM DGia
LEFT JOIN Muon ON DGia.MaDGia = Muon.MaDGia
GROUP BY DGia.MaDGia, DGia.TenDGia
ORDER BY SoLuongSachMuon DESC;

CREATE OR REPLACE FUNCTION TinhTongSoSachMuon(p_MaDGia NVARCHAR2) RETURN NUMBER
IS
    v_TongSoSach NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_TongSoSach
    FROM Muon
    WHERE MaDGia = p_MaDGia;

    RETURN v_TongSoSach;
END TinhTongSoSachMuon;

SELECT MaDGia, TinhTongSoSachMuon(MaDGia) AS TongSoSachMuon
FROM DGia;

CREATE OR REPLACE FUNCTION TinhTongSoSachTheoLoai RETURN SYS_REFCURSOR
IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT LSach.TenLSach, COUNT(Muon.MaSach) AS TongSoSach
        FROM Sach
        INNER JOIN Muon ON Sach.MaSach = Muon.MaSach
        INNER JOIN LSach ON Sach.MaLSach = LSach.MaLSach
        GROUP BY LSach.TenLSach;

    RETURN v_cursor;
END TinhTongSoSachTheoLoai;

DECLARE
    v_result SYS_REFCURSOR;
    v_tenLoaiSach NVARCHAR2(100);
    v_soLuongSach NUMBER;
BEGIN
    v_result := TinhTongSoSachTheoLoai();

    LOOP
        FETCH v_result INTO v_tenLoaiSach, v_soLuongSach;
        EXIT WHEN v_result%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Lo?i sách: ' || v_tenLoaiSach || ', T?ng s? sách: ' || v_soLuongSach);
    END LOOP;

    CLOSE v_result;
END;

CREATE OR REPLACE FUNCTION TinhTongSoSachTheoNXB RETURN SYS_REFCURSOR
IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT NXB.TenNXB, COUNT(Sach.MaSach) AS TongSoSach
        FROM Sach
        INNER JOIN NXB ON Sach.MaNXB = NXB.MaNXB
        GROUP BY NXB.TenNXB;

    RETURN v_cursor;
END TinhTongSoSachTheoNXB;

DECLARE
    v_result SYS_REFCURSOR;
    v_tenNXB NVARCHAR2(100);
    v_soLuongSach NUMBER;
BEGIN
    v_result := TinhTongSoSachTheoNXB();

    LOOP
        FETCH v_result INTO v_tenNXB, v_soLuongSach;
        EXIT WHEN v_result%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Nhà xu?t b?n: ' || v_tenNXB || ', T?ng s? sách: ' || v_soLuongSach);
    END LOOP;

    CLOSE v_result;
END;

CREATE OR REPLACE FUNCTION TinhTrungBinhSoLuongSachTheoLoai RETURN SYS_REFCURSOR
IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT LSach.TenLSach, AVG(Sach.SoLuong) AS TrungBinhSoLuong
        FROM Sach
        INNER JOIN LSach ON Sach.MaLSach = LSach.MaLSach
        GROUP BY LSach.TenLSach;

    RETURN v_cursor;
END TinhTrungBinhSoLuongSachTheoLoai;

DECLARE
    v_result SYS_REFCURSOR;
    v_tenLoaiSach NVARCHAR2(100);
    v_trungBinhSoLuong NUMBER;
BEGIN
    v_result := TinhTrungBinhSoLuongSachTheoLoai();

    LOOP
        FETCH v_result INTO v_tenLoaiSach, v_trungBinhSoLuong;
        EXIT WHEN v_result%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Lo?i sách: ' || v_tenLoaiSach || ', Trung bình s? l??ng sách: ' || v_trungBinhSoLuong);
    END LOOP;

    CLOSE v_result;
END;

CREATE OR REPLACE FUNCTION TinhTongSoSachTheoTacGia RETURN SYS_REFCURSOR
IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT TGia.TenTGia, COUNT(Sach.MaSach) AS TongSoSach
        FROM Sach
        INNER JOIN TGia ON Sach.MaTGia = TGia.MaTGia
        GROUP BY TGia.TenTGia;

    RETURN v_cursor;
END TinhTongSoSachTheoTacGia;

DECLARE
    v_result SYS_REFCURSOR;
    v_tenTacGia NVARCHAR2(100);
    v_tongSoSach NUMBER;
BEGIN
    v_result := TinhTongSoSachTheoTacGia();

    LOOP
        FETCH v_result INTO v_tenTacGia, v_tongSoSach;
        EXIT WHEN v_result%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Tác gi?: ' || v_tenTacGia || ', T?ng s? sách: ' || v_tongSoSach);
    END LOOP;

    CLOSE v_result;
END;

DECLARE
    v_soLuongSach NUMBER := 0;
BEGIN
    SELECT COUNT(*) INTO v_soLuongSach FROM Sach;

    IF v_soLuongSach = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Th? vi?n không còn sách.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('S? l??ng sách trong th? vi?n: ' || v_soLuongSach);
    END IF;
END;

DECLARE
    v_maSach VARCHAR2(50);
BEGIN
    FOR i IN 1..10 LOOP
        v_maSach := 'Mã sách ' || i;
        INSERT INTO Sach (MaSach, TenSach, SoLuong) VALUES (v_maSach, 'Tên sách ' || i, i);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('?ã thêm 10 sách vào th? vi?n.');
END;
select * from sach;
DECLARE
    v_maSach VARCHAR2(50);
    v_maLSach VARCHAR2(50);
    v_maTGia VARCHAR2(50);
    v_maNXB VARCHAR2(50);
BEGIN
    FOR i IN 1..10 LOOP
        v_maSach := 'M' || LPAD(i, 3, '0');  -- T?o mã sách M001, M002, ...
        v_maLSach := 'LS001';  -- MaLSach m?u
        v_maTGia := 'TG001';  -- MaTGia m?u
        v_maNXB := 'NXB001';  -- MaNXB m?u

        INSERT INTO Sach (MaSach, TenSach, MaLSach, MaTGia, MaNXB, SoLuong)
        VALUES (v_maSach, 'Tên sách ' || i, v_maLSach, v_maTGia, v_maNXB, i);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('?ã thêm 10 sách vào th? vi?n.');
END;

DECLARE
    v_count NUMBER := 0;
BEGIN
    SELECT COUNT(*) INTO v_count FROM DGia;

    -- Hi?n th? t?t c? mã ??c gi? và ??m s? l??ng
    FOR dgia_rec IN (SELECT MaDGia FROM DGia) LOOP
        DBMS_OUTPUT.PUT_LINE('Mã ??c gi?: ' || dgia_rec.MaDGia);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('T?ng s? ??c gi?: ' || v_count);
END;

SET SERVEROUTPUT ON;

DECLARE
    v_id DGia.MaDGia%TYPE;
    v_tenDGia DGia.TenDGia%TYPE;
    v_soLuong NUMBER := 0;
BEGIN
    -- L?y s? l??ng ??c gi?
    SELECT COUNT(*) INTO v_soLuong FROM DGia;

    -- Hi?n th? s? l??ng ??c gi?
    DBMS_OUTPUT.PUT_LINE('T?ng s? ??c gi?: ' || v_soLuong);
    
    -- L?y thông tin v? t?ng ??c gi? và hi?n th?
    WHILE v_soLuong > 0 LOOP
        -- L?y mã và tên ??c gi?
        SELECT MaDGia, TenDGia
        INTO v_id, v_tenDGia
        FROM DGia
        WHERE ROWNUM = v_soLuong;

        -- Hi?n th? thông tin ??c gi?
        DBMS_OUTPUT.PUT_LINE('Mã ??c gi?: ' || v_id || ', Tên ??c gi?: ' || v_tenDGia);

        -- Gi?m s? l??ng ??c gi? c?n l?y thông tin
        v_soLuong := v_soLuong - 1;
    END LOOP;
END;

DECLARE
    v_tenLSach LSach.TenLSach%TYPE;
    CURSOR c_lsach IS SELECT TenLSach FROM LSach;
BEGIN
    OPEN c_lsach;
    LOOP
        FETCH c_lsach INTO v_tenLSach;
        EXIT WHEN c_lsach%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Th? lo?i sách: ' || v_tenLSach);
    END LOOP;
    CLOSE c_lsach;
END;

SET SERVEROUTPUT ON;

DECLARE
    v_soLuongSach NUMBER := 0;
    v_soLuongDGia NUMBER := 0;
BEGIN
    -- ??m s? l??ng sách
    SELECT COUNT(*) INTO v_soLuongSach FROM Sach;
    
    -- Xu?t s? l??ng sách
    DBMS_OUTPUT.PUT_LINE('S? l??ng sách hi?n có: ' || v_soLuongSach);

    -- ??m s? l??ng ??c gi?
    SELECT COUNT(*) INTO v_soLuongDGia FROM DGia;
    
    -- Xu?t s? l??ng ??c gi?
    DBMS_OUTPUT.PUT_LINE('S? l??ng ??c gi? hi?n có: ' || v_soLuongDGia);

    -- Ki?m tra s? l??ng sách và ??c gi?
    IF v_soLuongSach > 0 AND v_soLuongDGia > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Th? vi?n có sách và ??c gi?.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Th? vi?n ch?a có sách ho?c ??c gi?.');
    END IF;
END;

DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count FROM DGia WHERE MaDGia = 'DG001';
    
    IF v_count > 0 THEN
        -- Th?c hi?n hành ??ng n?u ??c gi? t?n t?i
        DBMS_OUTPUT.PUT_LINE('??c gi? có t?n t?i.');
    ELSE
        -- Th?c hi?n hành ??ng n?u ??c gi? không t?n t?i
        DBMS_OUTPUT.PUT_LINE('??c gi? không t?n t?i.');
    END IF;
END;

SET SERVEROUTPUT ON;

SET SERVEROUTPUT ON;

DECLARE
    v_info NVARCHAR2(200);  -- Khai báo bi?n v_info ?? l?u thông tin sách

BEGIN
    FOR i IN 1..5 LOOP
        -- L?y thông tin sách cho m?i l??t l?p
        SELECT 'Thông tin sách ' || i || ': ' || TenSach
        INTO v_info
        FROM (
            SELECT TenSach, ROWNUM AS rn
            FROM Sach
        )
        WHERE rn = i;

        -- Hi?n th? thông tin sách
        DBMS_OUTPUT.PUT_LINE(v_info);
    END LOOP;
END;


DECLARE
    v_counter NUMBER := 1;
    v_dgia DGia%ROWTYPE;
BEGIN
    WHILE v_counter <= 5 LOOP
        -- L?y thông tin ??c gi?
        SELECT * INTO v_dgia
        FROM DGia
        WHERE MaDGia = 'DG00' || v_counter;

        -- Hi?n th? thông tin ??c gi?
        DBMS_OUTPUT.PUT_LINE('Thông tin ??c gi? ' || v_counter || ': ' || v_dgia.TenDGia);

        -- L?y sách mà ??c gi? m??n
        FOR v_sach IN (SELECT Sach.TenSach
                        FROM Muon
                        JOIN Sach ON Muon.MaSach = Sach.MaSach
                        WHERE Muon.MaDGia = v_dgia.MaDGia) LOOP
            -- Hi?n th? sách mà ??c gi? m??n
            DBMS_OUTPUT.PUT_LINE('  - Sách m??n: ' || v_sach.TenSach);
        END LOOP;

        v_counter := v_counter + 1;
    END LOOP;
END;

CREATE OR REPLACE PROCEDURE DisplayBookInfo AS
  -- Khai báo bi?n ?? l?u thông tin sách
  v_MaSach Sach.MaSach%TYPE;
  v_TenSach Sach.TenSach%TYPE;
  v_MaLSach Sach.MaLSach%TYPE;
  v_MaTGia Sach.MaTGia%TYPE;
  v_MaNXB Sach.MaNXB%TYPE;
  v_SoLuong Sach.SoLuong%TYPE;

BEGIN
  -- Cursor ?? l?y thông tin sách
  FOR book_rec IN (SELECT * FROM Sach) LOOP
    v_MaSach := book_rec.MaSach;
    v_TenSach := book_rec.TenSach;
    v_MaLSach := book_rec.MaLSach;
    v_MaTGia := book_rec.MaTGia;
    v_MaNXB := book_rec.MaNXB;
    v_SoLuong := book_rec.SoLuong;

    -- Hi?n th? thông tin sách
    DBMS_OUTPUT.PUT_LINE('Book ID: ' || v_MaSach || ', Title: ' || v_TenSach || ', Category: ' || v_MaLSach ||
                        ', Author ID: ' || v_MaTGia || ', Publisher ID: ' || v_MaNXB || ', Quantity: ' || v_SoLuong);
  END LOOP;
END;

BEGIN
  DisplayBookInfo;
END;

CREATE OR REPLACE PROCEDURE ThemSach(
    p_MaSach NVARCHAR2,
    p_TenSach NVARCHAR2,
    p_MaLSach NVARCHAR2,
    p_MaTGia NVARCHAR2,
    p_MaNXB NVARCHAR2,
    p_SoLuong NUMBER
)
IS
BEGIN
    INSERT INTO Sach (MaSach, TenSach, MaLSach, MaTGia, MaNXB, SoLuong)
    VALUES (p_MaSach, p_TenSach, p_MaLSach, p_MaTGia, p_MaNXB, p_SoLuong);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Sách ?ã ???c thêm vào th? vi?n.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('L?i: ' || SQLERRM);
END;

BEGIN
  ThemSach('MS001', 'Ti?ng Anh C? B?n', 'LS001', 'TG001', 'NXB001', 50);
END;

SELECT * FROM SACH;

CREATE OR REPLACE PROCEDURE PrintReaderInfo(
    p_MaDGia NVARCHAR2
)
IS
    v_TenDGia DGia.TenDGia%TYPE;
    v_NgaySinhDGia DGia.NgaySinhDGia%TYPE;
    v_GTinh DGia.GTinh%TYPE;
    v_DChiDGia DGia.DChiDGia%TYPE;
    v_TTDGia DGia.TTDGia%TYPE;
    v_SDT DGia.SDT%TYPE;
BEGIN
    -- SELECT thông tin ??c gi?
    SELECT TenDGia, NgaySinhDGia, GTinh, DChiDGia, TTDGia, SDT
    INTO v_TenDGia, v_NgaySinhDGia, v_GTinh, v_DChiDGia, v_TTDGia, v_SDT
    FROM DGia
    WHERE MaDGia = p_MaDGia;

    -- Hi?n th? thông tin ??c gi?
    DBMS_OUTPUT.PUT_LINE('Reader ID: ' || p_MaDGia);
    DBMS_OUTPUT.PUT_LINE('Reader Name: ' || v_TenDGia);
    DBMS_OUTPUT.PUT_LINE('Date of Birth: ' || TO_CHAR(v_NgaySinhDGia, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('Gender: ' || CASE v_GTinh WHEN 1 THEN 'Male' ELSE 'Female' END);
    DBMS_OUTPUT.PUT_LINE('Address: ' || v_DChiDGia);
    DBMS_OUTPUT.PUT_LINE('Status: ' || CASE v_TTDGia WHEN 1 THEN 'Active' ELSE 'Inactive' END);
    DBMS_OUTPUT.PUT_LINE('Phone Number: ' || v_SDT);
END;

BEGIN
  PrintReaderInfo('DG001');
END;

CREATE OR REPLACE PROCEDURE CapNhatThongTinSach(
    p_MaSach NVARCHAR2,
    p_TenSach NVARCHAR2,
    p_MaLSach NVARCHAR2,
    p_MaTGia NVARCHAR2,
    p_MaNXB NVARCHAR2,
    p_SoLuong NUMBER
)
IS
BEGIN
    UPDATE Sach
    SET TenSach = p_TenSach, MaLSach = p_MaLSach, MaTGia = p_MaTGia, MaNXB = p_MaNXB, SoLuong = p_SoLuong
    WHERE MaSach = p_MaSach;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Thông tin sách ?ã ???c c?p nh?t.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('L?i: ' || SQLERRM);
END;

BEGIN
  CapNhatThongTinSach('MS001', 'Sách m?i c?p nh?t', 'LS002', 'TG002', 'NXB002', 100);
END;

select * from sach;

CREATE OR REPLACE PROCEDURE ThemDongia(
    p_MaDGia NVARCHAR2,
    p_TenDGia NVARCHAR2,
    p_NgaySinhDGia DATE,
    p_GTinh NUMBER,
    p_DChiDGia NVARCHAR2,
    p_TTDGia NUMBER,
    p_SDT NVARCHAR2
)
AS
BEGIN
    INSERT INTO DGia (MaDGia, TenDGia, NgaySinhDGia, GTinh, DChiDGia, TTDGia, SDT)
    VALUES (p_MaDGia, p_TenDGia, p_NgaySinhDGia, p_GTinh, p_DChiDGia, p_TTDGia, p_SDT);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('??c gi? m?i ?ã ???c thêm.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('L?i: ' || SQLERRM);
END ThemDongia;

BEGIN
    ThemDongia('DG004', 'Nguy?n V?n D', TO_DATE('1995-07-20', 'YYYY-MM-DD'), 1, 'Hà N?i', 1, '0987654322');
END;

select* from DGia;

CREATE OR REPLACE PROCEDURE XoaSach(
    p_MaSach NVARCHAR2
)
AS
BEGIN
    DELETE FROM Sach WHERE MaSach = p_MaSach;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Sách v?i mã ' || p_MaSach || ' ?ã ???c xoá.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('L?i: ' || SQLERRM);
END XoaSach;

BEGIN
    XoaSach('MS001');
END;
select * from Sach;

CREATE OR REPLACE PROCEDURE KiemTraSoLuongSach(
    p_MaSach NVARCHAR2
)
AS
    v_SoLuong NUMBER;
BEGIN
    SELECT SoLuong INTO v_SoLuong FROM Sach WHERE MaSach = p_MaSach;

    IF v_SoLuong > 0 THEN
        DBMS_OUTPUT.PUT_LINE('S? l??ng sách còn trong kho cho mã sách ' || p_MaSach || ': ' || v_SoLuong);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Không còn sách nào trong kho cho mã sách ' || p_MaSach);
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Không tìm th?y thông tin cho mã sách ' || p_MaSach);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('L?i: ' || SQLERRM);
END KiemTraSoLuongSach;

BEGIN
    KiemTraSoLuongSach('S001');
END;

CREATE OR REPLACE PROCEDURE InDanhSachDGiaTheoLoaiSach(
    p_MaLSach NVARCHAR2
)
AS
BEGIN
    FOR dg IN (SELECT * FROM DGia WHERE MaDGia IN (SELECT MaDGia FROM Sach WHERE MaLSach = p_MaLSach)) LOOP
        DBMS_OUTPUT.PUT_LINE('Mã ??c gi?: ' || dg.MaDGia || ', Tên ??c gi?: ' || dg.TenDGia);
    END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Không có ??c gi? nào cho lo?i sách có mã ' || p_MaLSach);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('L?i: ' || SQLERRM);
END InDanhSachDGiaTheoLoaiSach;

BEGIN
    InDanhSachDGiaTheoLoaiSach('LS001');
END;

CREATE OR REPLACE PROCEDURE TinhTrungBinhSoLuongSachMoiLoaiSach AS
BEGIN
    FOR ls IN (SELECT MaLSach, AVG(SoLuong) AS TrungBinhSoLuong FROM Sach GROUP BY MaLSach) LOOP
        DBMS_OUTPUT.PUT_LINE('Lo?i sách có mã ' || ls.MaLSach || ' có trung bình s? l??ng sách: ' || TO_CHAR(ls.TrungBinhSoLuong));
    END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Không có d? li?u sách.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('L?i: ' || SQLERRM);
END TinhTrungBinhSoLuongSachMoiLoaiSach;

BEGIN
    TinhTrungBinhSoLuongSachMoiLoaiSach;
END;

CREATE OR REPLACE PROCEDURE TinhTongSoSachMoiNXB AS
BEGIN
    FOR nxb IN (SELECT MaNXB, SUM(SoLuong) AS TongSoSach FROM Sach GROUP BY MaNXB) LOOP
        DBMS_OUTPUT.PUT_LINE('Nhà xu?t b?n có mã ' || nxb.MaNXB || ' ?ã xu?t b?n t?ng s? sách: ' || TO_CHAR(nxb.TongSoSach));
    END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Không có d? li?u sách.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('L?i: ' || SQLERRM);
END TinhTongSoSachMoiNXB;

BEGIN
    TinhTongSoSachMoiNXB;
END;

CREATE OR REPLACE FUNCTION ThemDocGia(
    p_MaDGia NVARCHAR2,
    p_TenDGia NVARCHAR2,
    p_NgaySinhDGia DATE,
    p_GTinh NUMBER,
    p_DChiDGia NVARCHAR2,
    p_TTDGia NUMBER,
    p_SDT NVARCHAR2
) AS
BEGIN
    INSERT INTO DGia (MaDGia, TenDGia, NgaySinhDGia, GTinh, DChiDGia, TTDGia, SDT)
    VALUES (p_MaDGia, p_TenDGia, p_NgaySinhDGia, p_GTinh, p_DChiDGia, p_TTDGia, p_SDT);
END;

CREATE OR REPLACE FUNCTION ThemDocGia(
    p_MaDGia NVARCHAR2,
    p_TenDGia NVARCHAR2,
    p_NgaySinhDGia DATE,
    p_GTinh NUMBER,
    p_DChiDGia NVARCHAR2,
    p_TTDGia NUMBER,
    p_SDT NVARCHAR2
)
RETURN NUMBER
IS
BEGIN
    INSERT INTO DGia (MaDGia, TenDGia, NgaySinhDGia, GTinh, DChiDGia, TTDGia, SDT)
    VALUES (p_MaDGia, p_TenDGia, p_NgaySinhDGia, p_GTinh, p_DChiDGia, p_TTDGia, p_SDT);

    -- Thêm các x? lý khác n?u c?n

    -- Tr? v? m?t giá tr? (n?u c?n)
    RETURN 1;
END;

DECLARE
  v_Result NUMBER;
BEGIN
  v_Result := ThemDocGia('DG011', 'Nguyen Van A', TO_DATE('1980-01-15', 'YYYY-MM-DD'), 1, '123 Street, ABC City', 1, '123456789');
  DBMS_OUTPUT.PUT_LINE('Result: ' || v_Result);
END;

CREATE OR REPLACE FUNCTION CapNhatThongTinDGia(
    p_MaDGia NVARCHAR2,
    p_TenDGia NVARCHAR2,
    p_NgaySinhDGia DATE,
    p_GTinh NUMBER,
    p_DChiDGia NVARCHAR2,
    p_TTDGia NUMBER,
    p_SDT NVARCHAR2
)
RETURN NUMBER
IS
BEGIN
    UPDATE DGia
    SET TenDGia = p_TenDGia,
        NgaySinhDGia = p_NgaySinhDGia,
        GTinh = p_GTinh,
        DChiDGia = p_DChiDGia,
        TTDGia = p_TTDGia,
        SDT = p_SDT
    WHERE MaDGia = p_MaDGia;

    -- Ki?m tra s? hàng b? ?nh h??ng b?i UPDATE
    IF SQL%ROWCOUNT = 1 THEN
        -- N?u c?p nh?t thành công, tr? v? 1
        RETURN 1;
    ELSE
        -- N?u không có hàng nào ???c c?p nh?t, tr? v? 0
        RETURN 0;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        -- X? lý l?i và tr? v? -1
        RETURN -1;
END;

DECLARE
  v_Result NUMBER;
BEGIN
  v_Result := CapNhatThongTinDGia('DG001', 'Nguyen Van B', TO_DATE('1990-05-20', 'YYYY-MM-DD'), 0, '456 Street, XYZ City', 0, '987654321');
  DBMS_OUTPUT.PUT_LINE('Result: ' || v_Result);
END;

SELECT * FROM DGIA;

CREATE OR REPLACE FUNCTION XoaDocGia(
    p_MaDGia NVARCHAR2
)
RETURN NUMBER
IS
BEGIN
    DELETE FROM DGia
    WHERE MaDGia = p_MaDGia;

    -- Ki?m tra s? hàng b? ?nh h??ng b?i DELETE
    IF SQL%ROWCOUNT = 1 THEN
        -- N?u xóa thành công, tr? v? 1
        RETURN 1;
    ELSE
        -- N?u không có hàng nào b? xóa (do không tìm th?y Mã ??c gi?), tr? v? 0
        RETURN 0;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        -- X? lý l?i và tr? v? -1
        RETURN -1;
END;

DECLARE
  v_Result NUMBER;
BEGIN
  v_Result := XoaDocGia('DG011');
  IF v_Result = 1 THEN
    DBMS_OUTPUT.PUT_LINE('?ã xóa ??c gi? thành công.');
  ELSIF v_Result = 0 THEN
    DBMS_OUTPUT.PUT_LINE('Không tìm th?y ??c gi? ?? xóa.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('L?i khi xóa ??c gi?.');
  END IF;
END;

CREATE OR REPLACE FUNCTION CapNhatSoLuongSach(
    p_MaSach NVARCHAR2,
    p_SoLuong NUMBER
)
RETURN NUMBER
IS
BEGIN
    UPDATE Sach
    SET SoLuong = p_SoLuong
    WHERE MaSach = p_MaSach;

    -- Ki?m tra s? hàng b? ?nh h??ng b?i UPDATE
    IF SQL%ROWCOUNT = 1 THEN
        -- N?u c?p nh?t thành công, tr? v? 1
        RETURN 1;
    ELSE
        -- N?u không có hàng nào ???c c?p nh?t, tr? v? 0
        RETURN 0;
    END IF;
END;
-- G?i hàm CapNhatSoLuongSach ?? c?p nh?t s? l??ng sách cho mã sách 'MS001' thành 50.
DECLARE
  v_Result NUMBER;
BEGIN
  v_Result := CapNhatSoLuongSach('MS001', 50);

  IF v_Result = 1 THEN
    DBMS_OUTPUT.PUT_LINE('S? l??ng sách ?ã ???c c?p nh?t thành công.');
  ELSIF v_Result = 0 THEN
    DBMS_OUTPUT.PUT_LINE('Không tìm th?y sách có mã sách c?n c?p nh?t.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('L?i khi c?p nh?t s? l??ng sách.');
  END IF;
END;

CREATE OR REPLACE FUNCTION ThemPhieuMuon(
    p_MaID NVARCHAR2,
    p_MaSach NVARCHAR2,
    p_MaDGia NVARCHAR2,
    p_NgayMuon DATE,
    p_SoLuong NUMBER
)
RETURN NUMBER
IS
    v_MaMuon NUMBER;
BEGIN
    -- L?y giá tr? m?i t? sequence cho mã m??n
    SELECT MaMuonSeq.NEXTVAL INTO v_MaMuon FROM DUAL;

    -- Thêm m?i phi?u m??n sách
    INSERT INTO Muon (MaMuon, MaID, MaSach, MaDGia, NgayMuon, SoLuong)
    VALUES (v_MaMuon, p_MaID, p_MaSach, p_MaDGia, p_NgayMuon, p_SoLuong);

    -- Ki?m tra s? hàng b? ?nh h??ng b?i INSERT
    IF SQL%ROWCOUNT = 1 THEN
        -- N?u thêm m?i thành công, tr? v? mã m??n
        RETURN v_MaMuon;
    ELSE
        -- N?u không thêm ???c phi?u m??n sách (do l?i ho?c vi ph?m ràng bu?c), tr? v? -1
        RETURN -1;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        -- X? lý l?i và tr? v? -1
        RETURN -1;
END;


DECLARE
  v_Result NUMBER;
BEGIN
  v_Result := ThemPhieuMuon('ID001', 'S004', 'DG001', TO_DATE('2023-09-30', 'YYYY-MM-DD'), 2);
  IF v_Result = 1 THEN
    DBMS_OUTPUT.PUT_LINE('Phi?u m??n sách ?ã ???c thêm m?i thành công.');
  ELSIF v_Result = 0 THEN
    DBMS_OUTPUT.PUT_LINE('Không th? thêm m?i phi?u m??n sách.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('L?i khi thêm m?i phi?u m??n sách.');
  END IF;
END;
select * from muon;

CREATE OR REPLACE FUNCTION CapNhatPhieuMuon(
    p_MaMuon NUMBER,
    p_MaID NVARCHAR2,
    p_MaSach NVARCHAR2,
    p_MaDGia NVARCHAR2,
    p_NgayMuon DATE,
    p_SoLuong NUMBER
)
RETURN NUMBER
IS
BEGIN
    -- C?p nh?t thông tin phi?u m??n sách
    UPDATE Muon
    SET MaID = p_MaID,
        MaSach = p_MaSach,
        MaDGia = p_MaDGia,
        NgayMuon = p_NgayMuon,
        SoLuong = p_SoLuong
    WHERE MaMuon = p_MaMuon;

    -- Ki?m tra s? hàng b? ?nh h??ng b?i UPDATE
    IF SQL%ROWCOUNT = 1 THEN
        -- N?u c?p nh?t thành công, tr? v? 1
        RETURN 1;
    ELSE
        -- N?u không c?p nh?t ???c phi?u m??n sách (do không tìm th?y mã m??n), tr? v? 0
        RETURN 0;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        -- X? lý l?i và tr? v? -1
        RETURN -1;
END;
select * from muon;
DECLARE
  v_Result NUMBER;
BEGIN
  v_Result := CapNhatPhieuMuon(123, 'ID002', 'MS002', 'DG002', TO_DATE('2023-10-01', 'YYYY-MM-DD'), 3);
  IF v_Result = 1 THEN
    DBMS_OUTPUT.PUT_LINE('Thông tin phi?u m??n sách ?ã ???c c?p nh?t thành công.');
  ELSIF v_Result = 0 THEN
    DBMS_OUTPUT.PUT_LINE('Không tìm th?y phi?u m??n sách ?? c?p nh?t.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('L?i khi c?p nh?t thông tin phi?u m??n sách.');
  END IF;
END;

CREATE OR REPLACE FUNCTION XoaPhieuMuon(
    p_MaMuon NUMBER
)
RETURN NUMBER
IS
BEGIN
    -- Xóa phi?u m??n sách
    DELETE FROM Muon
    WHERE MaMuon = p_MaMuon;

    -- Ki?m tra s? hàng b? ?nh h??ng b?i DELETE
    IF SQL%ROWCOUNT = 1 THEN
        -- N?u xóa thành công, tr? v? 1
        RETURN 1;
    ELSE
        -- N?u không xóa ???c phi?u m??n sách (do không tìm th?y mã m??n), tr? v? 0
        RETURN 0;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        -- X? lý l?i và tr? v? -1
        RETURN -1;
END;

DECLARE
  v_Result NUMBER;
BEGIN
  v_Result := XoaPhieuMuon(6);
  IF v_Result = 1 THEN
    DBMS_OUTPUT.PUT_LINE('Phi?u m??n sách ?ã ???c xóa thành công.');
  ELSIF v_Result = 0 THEN
    DBMS_OUTPUT.PUT_LINE('Không tìm th?y phi?u m??n sách ?? xóa.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('L?i khi xóa phi?u m??n sách.');
  END IF;
END;

CREATE OR REPLACE FUNCTION ThemPhieuTra(
    p_MaMuon NUMBER,
    p_NgayTra DATE
)
RETURN NUMBER
IS
BEGIN
    -- Thêm m?i phi?u tr? sách
    INSERT INTO Tra (MaMuon, NgayTra)
    VALUES (p_MaMuon, p_NgayTra);

    -- Ki?m tra s? hàng b? ?nh h??ng b?i INSERT
    IF SQL%ROWCOUNT = 1 THEN
        -- N?u thêm m?i thành công, tr? v? 1
        RETURN 1;
    ELSE
        -- N?u không thêm ???c phi?u tr? sách (do không tìm th?y mã m??n), tr? v? 0
        RETURN 0;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        -- X? lý l?i và tr? v? -1
        RETURN -1;
END;
select * from tra;
DECLARE
  v_Result NUMBER;
BEGIN
  v_Result := ThemPhieuTra(4, TO_DATE('2023-10-10', 'YYYY-MM-DD'));
  IF v_Result = 1 THEN
    DBMS_OUTPUT.PUT_LINE('Phi?u tr? sách ?ã ???c thêm m?i thành công.');
  ELSIF v_Result = 0 THEN
    DBMS_OUTPUT.PUT_LINE('Không tìm th?y phi?u m??n ?? thêm m?i phi?u tr? sách.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('L?i khi thêm m?i phi?u tr? sách.');
  END IF;
END;

CREATE OR REPLACE PROCEDURE TinhTongSoSachTheoNXB
IS
BEGIN
    -- T?o b?ng t?m ?? l?u k?t qu?
    CREATE GLOBAL TEMPORARY TABLE Temp_SoSachNXB
    ON COMMIT PRESERVE ROWS
    AS
    SELECT MaNXB, SUM(SoLuong) AS TongSoSach
    FROM Sach
    GROUP BY MaNXB;

    -- Hi?n th? k?t qu?
    SELECT * FROM Temp_SoSachNXB;
END;
/

BEGIN
  TinhTongSoSachTheoNXB;
END;

CREATE USER USER12 IDENTIFIED BY password1;
GRANT CONNECT, RESOURCE TO USER12;
CONNECT USER12/password1

CREATE OR REPLACE TRIGGER update_book_count_after_insert
AFTER INSERT ON Sach
FOR EACH ROW
BEGIN
  UPDATE LSach
  SET SoLuong = SoLuong + :NEW.SoLuong
  WHERE MaLSach = :NEW.MaLSach;
END;

STARTUP;
SHUTDOWN;

CREATE TABLESPACE your_tablespace
DATAFILE 'path_to_datafile' SIZE 100M;

ALTER DATABASE DATAFILE 'path_to_datafile' RESIZE 200M;

DROP TABLESPACE your_tablespace INCLUDING CONTENTS AND DATAFILES;

ALTER DATABASE RENAME FILE 'old_path_to_datafile' TO 'new_path_to_datafile';

ALTER DATABASE DATAFILE 'path_to_datafile' AUTOEXTEND ON MAXSIZE max_size;

ALTER DATABASE DATAFILE 'path_to_datafile' AUTOEXTEND OFF;

SELECT * FROM DBA_TABLESPACES WHERE TABLESPACE_NAME = 'your_tablespace';

SELECT * FROM DBA_DATA_FILES WHERE TABLESPACE_NAME = 'your_tablespace';



















//1
CREATE PROCEDURE USP_GetSachList
AS
BEGIN
    SELECT Sach.MaSach, Sach.TenSach, LSach.TenLSach AS TenLSach, TGia.TenTGia, NXB.TenNXB, Sach.SoLuong
    FROM Sach
    JOIN LSach ON Sach.MaLSach = LSach.MaLSach
    JOIN TGia ON Sach.MaTGia = TGia.MaTGia
    JOIN NXB ON Sach.MaNXB = NXB.MaNXB
END
//2
CREATE PROCEDURE USP_SearchSachList
    @TenSach nvarchar(100)
AS
BEGIN
    SELECT Sach.MaSach, Sach.TenSach, LSach.TenLSach, TGia.TenTGia, NXB.TenNXB, Sach.SoLuong
    FROM Sach
    INNER JOIN LSach ON Sach.MaLSach = LSach.MaLSach
    INNER JOIN TGia ON Sach.MaTGia = TGia.MaTGia
    INNER JOIN NXB ON Sach.MaNXB = NXB.MaNXB
    WHERE Sach.TenSach LIKE '%' + @TenSach + '%'
END
//3
CREATE PROCEDURE USP_GetSachListMa
    @MaSach nvarchar(50)
AS
BEGIN
    SELECT Sach.MaSach, Sach.TenSach, LSach.TenLSach, TGia.TenTGia, NXB.TenNXB, Sach.SoLuong
    FROM Sach
    INNER JOIN LSach ON Sach.MaLSach = LSach.MaLSach
    INNER JOIN TGia ON Sach.MaTGia = TGia.MaTGia
    INNER JOIN NXB ON Sach.MaNXB = NXB.MaNXB
    WHERE Sach.MaSach = @MaSach
END
//4
CREATE PROCEDURE USP_DeletSach
    @MaSach nvarchar(50)
AS
BEGIN
    DELETE FROM Sach WHERE MaSach = @MaSach
END
//5
CREATE PROCEDURE USP_UpdateListDGia
    @MaDGia nvarchar(50),
    @TenDGia nvarchar(50),
    @NgaySinhDGia DATE,
    @GTinh bit,
    @DChiDGia nvarchar(100),
    @TTDGia bit,
    @SDT nvarchar(20)
AS
BEGIN
    UPDATE DGia
    SET TenDGia = @TenDGia, 
        NgaySinhDGia = @NgaySinhDGia, 
        GTinh = @GTinh, 
        DChiDGia = @DChiDGia, 
        TTDGia = @TTDGia, 
        SDT = @SDT
    WHERE MaDGia = @MaDGia
END
//6
CREATE PROCEDURE USP_AddDGia
    @MaDGia nvarchar(50),
    @TenDGia nvarchar(50),
    @NgaySinhDGia DATE,
    @GTinh bit,
    @DChiDGia nvarchar(100),
    @TTDGia bit,
    @SDT nvarchar(20)
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM DGia WHERE MaDGia = @MaDGia)
    BEGIN
        INSERT INTO DGia (MaDGia, TenDGia, NgaySinhDGia, GTinh, DChiDGia, TTDGia, SDT)
        VALUES (@MaDGia, @TenDGia, @NgaySinhDGia, @GTinh, @DChiDGia, @TTDGia, @SDT)
        PRINT 'Thêm ??c gi? thành công'
    END
    ELSE
    BEGIN
        PRINT '??c gi? ?ã t?n t?i'
    END
END
//7
CREATE PROCEDURE USP_DeleteDGia
    @MaDGia nvarchar(50)
AS
BEGIN
    DELETE FROM DGia WHERE MaDGia = @MaDGia;
END
//8
CREATE PROCEDURE USP_AddLSachList
    @MaLSach nvarchar(50),
    @TenLSach nvarchar(50)
AS
BEGIN
    INSERT INTO LSach (MaLSach, TenLSach)
    VALUES (@MaLSach, @TenLSach)
END
//9
CREATE PROCEDURE USP_InsertLSachList
    @MaLSach nvarchar(50),
    @TenLSach nvarchar(50)
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO LSach (MaLSach, TenLSach)
    VALUES (@MaLSach, @TenLSach)
END
//10
CREATE PROCEDURE USP_DeleteLSach
    @MaLSach nvarchar(50)
AS
BEGIN
    DELETE FROM LSach
    WHERE MaLSach = @MaLSach
END
//11
CREATE PROCEDURE USP_InsertMuonSch
    @MaID nvarchar(50),
    @MaSach nvarchar(50),
    @MaDGia nvarchar(50),
    @NgayMuon DATE,
    @SoLuong INT,
    @TTMuon nvarchar(50),
    @MK nvarchar(50)
AS
BEGIN
    INSERT INTO MuonSach(MaID, MaSach, MaDGia, NgayMuon, SoLuong, TTMuon, MK)
    VALUES (@MaID, @MaSach, @MaDGia, @NgayMuon, @SoLuong, @TTMuon, @MK)
END
//12
CREATE PROCEDURE USP_InsertNXBList 
    @MaNXB nvarchar(50),
    @TenNXB nvarchar(100)
AS
BEGIN
    INSERT INTO NXB(MaNXB, TenNXB)
    VALUES (@MaNXB, @TenNXB);
END

--exec USP_DeleteNXB @MaNXB
CREATE PROCEDURE USP_DeleteNXB
    @MaNXB nvarchar(50)
AS
BEGIN
    DELETE FROM NXB
    WHERE MaNXB = @MaNXB
END
//13
CREATE PROCEDURE USP_AddTGiaList
	@MaTGia nvarchar(50),
	@TenTGia nvarchar(100)
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM TGia WHERE MaTGia = @MaTGia)
	BEGIN
		INSERT INTO TGia(MaTGia, TenTGia)
		VALUES (@MaTGia, @TenTGia)
	END
END
//14
CREATE PROCEDURE USP_DeleteTGia
	@MaTGia nvarchar(50)
AS
BEGIN
	IF EXISTS (SELECT * FROM TGia WHERE MaTGia = @MaTGia)
	BEGIN
		DELETE FROM TGia WHERE MaTGia = @MaTGia
	END
END
