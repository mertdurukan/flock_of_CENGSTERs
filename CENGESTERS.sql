--	Sorular
--	Delete ve truncate arasýndaki fark nedir?
--	Drop vs Delete arasýndaki fark nedir?

-- Tablonun verilerini çaðýrmak
SELECT * FROM SOLDIERS

-- Tablonun içerisindeki tüm verileri temizleme
TRUNCATE TABLE SOLDIERS

-- Tablonun içerisine veri eklemek
INSERT INTO SOLDIERS([NAME], [INUMBER], [CREATED_DATETIME])
VALUES('Durukan', 10216497851, GETDATE())

INSERT INTO SOLDIERS([NAME], [INUMBER], [CREATED_DATETIME])
VALUES('Damla', 15468545426, GETDATE())

INSERT INTO SOLDIERS([NAME], [INUMBER], [CREATED_DATETIME])
VALUES('Durukan', 84895154874, GETDATE())

-- Tablodan kayýt silme Id'ye göre
--DELETE SOLDIERS WHERE ID = 3

-- Tablodan kayýt silme isme göre
--DELETE SOLDIERS WHERE NAME = 'Damla'

-- Tablodaki kayýt üzerinde deðiþiklik yapmak id'ye göre
UPDATE SOLDIERS SET NAME = 'MERT', INUMBER= '32546698542' WHERE ID = 1
--  Tablodaki kayýt üzerinde deðiþiklik yapmak isme göre
UPDATE SOLDIERS SET INUMBER= '16489556214' WHERE NAME = 'Damla'


--  Tablonun verilerini çaðýrmak
SELECT * FROM MISSIONS

--  Görev ekledim
INSERT INTO MISSIONS([NAME], [LEFTTIME_DATETIME])
VALUES('Yeni Eklenen Þafak Saldýrýsý',GETDATE())

--  Varolan göreve asker atadým
UPDATE MISSIONS SET SOLDIER_REF = 3 WHERE NAME = 'Kartal Harekatý'

---------------------------------------------------------------------------------------------------------

--  Tablo Birleþtirmeden getirmek, 2 tabloda getirmek
SELECT NAME,INUMBER,CREATED_DATETIME FROM SOLDIERS WHERE ID = 3
SELECT NAME,LEFTTIME_DATETIME FROM MISSIONS WHERE SOLDIER_REF = 3


-- INNER JOIN ÝÞLEMÝ
SELECT * FROM SOLDIERS
INNER JOIN MISSIONS
ON SOLDIERS.ID = MISSIONS.SOLDIER_REF

-- LEFT JOIN ÝÞLEMÝ
SELECT * FROM SOLDIERS
LEFT JOIN MISSIONS
ON SOLDIERS.ID = MISSIONS.SOLDIER_REF

-- RIGHT JOIN ÝÞLEMÝ
SELECT * FROM SOLDIERS
RIGHT JOIN MISSIONS
ON SOLDIERS.ID = MISSIONS.SOLDIER_REF
