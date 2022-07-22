--	Sorular
--	Delete ve truncate aras�ndaki fark nedir?
--	Drop vs Delete aras�ndaki fark nedir?

-- Tablonun verilerini �a��rmak
SELECT * FROM SOLDIERS

-- Tablonun i�erisindeki t�m verileri temizleme
TRUNCATE TABLE SOLDIERS

-- Tablonun i�erisine veri eklemek
INSERT INTO SOLDIERS([NAME], [INUMBER], [CREATED_DATETIME])
VALUES('Durukan', 10216497851, GETDATE())

INSERT INTO SOLDIERS([NAME], [INUMBER], [CREATED_DATETIME])
VALUES('Damla', 15468545426, GETDATE())

INSERT INTO SOLDIERS([NAME], [INUMBER], [CREATED_DATETIME])
VALUES('Durukan', 84895154874, GETDATE())

-- Tablodan kay�t silme Id'ye g�re
--DELETE SOLDIERS WHERE ID = 3

-- Tablodan kay�t silme isme g�re
--DELETE SOLDIERS WHERE NAME = 'Damla'

-- Tablodaki kay�t �zerinde de�i�iklik yapmak id'ye g�re
UPDATE SOLDIERS SET NAME = 'MERT', INUMBER= '32546698542' WHERE ID = 1
--  Tablodaki kay�t �zerinde de�i�iklik yapmak isme g�re
UPDATE SOLDIERS SET INUMBER= '16489556214' WHERE NAME = 'Damla'


--  Tablonun verilerini �a��rmak
SELECT * FROM MISSIONS

--  G�rev ekledim
INSERT INTO MISSIONS([NAME], [LEFTTIME_DATETIME])
VALUES('Yeni Eklenen �afak Sald�r�s�',GETDATE())

--  Varolan g�reve asker atad�m
UPDATE MISSIONS SET SOLDIER_REF = 3 WHERE NAME = 'Kartal Harekat�'

---------------------------------------------------------------------------------------------------------

--  Tablo Birle�tirmeden getirmek, 2 tabloda getirmek
SELECT NAME,INUMBER,CREATED_DATETIME FROM SOLDIERS WHERE ID = 3
SELECT NAME,LEFTTIME_DATETIME FROM MISSIONS WHERE SOLDIER_REF = 3


-- INNER JOIN ��LEM�
SELECT * FROM SOLDIERS
INNER JOIN MISSIONS
ON SOLDIERS.ID = MISSIONS.SOLDIER_REF

-- LEFT JOIN ��LEM�
SELECT * FROM SOLDIERS
LEFT JOIN MISSIONS
ON SOLDIERS.ID = MISSIONS.SOLDIER_REF

-- RIGHT JOIN ��LEM�
SELECT * FROM SOLDIERS
RIGHT JOIN MISSIONS
ON SOLDIERS.ID = MISSIONS.SOLDIER_REF
