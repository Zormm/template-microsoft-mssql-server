/*markdown
# Anlegen der Datenbank Einkauf-Historie
*/

CREATE DATABASE EinkaufHistorie

/*markdown
# Anlegen der Tabelle Produkte, Kaufhistorie
*/

CREATE Table Produkte(
    Name nvarchar(max),
    Preis DECIMAL
);

CREATE Table Kaufhistorie (
    Datum date,
    Anzahl int
);

/*markdown
# Prüfen des bisherigen Ergebnisses
*/

SELECT * FROM Produkte 

/*markdown
# Anlegen mehrere Produkte
*/

INSERT INTO Produkte (Name, Preis)
VALUES ('Milch', 1.99)

/*markdown
# Korrektur der Produkte Tabelle
*/

ALTER TABLE Produkte 
ALTER COLUMN Preis DECIMAL(10,2)

/*markdown
# Die Ursprüngliche Präzision haben wir verloren. Diese stellen wir nun wieder her mit dem Update Befehl und ändern den bestehenden Preis der Milch zurück auf den Präzisen Wert von Preis = 1,99 €
*/

UPDATE Produkte
SET Preis = 1.99
WHERE Name = 'Milch'

/*markdown
# Verändern der Produkte und Kaufhistorie Tabelle
Die Produkte Tabelle erhält einen Primärschlüssel und die Kaufhistorie einen Fremdschlüssel zur Produkte Tabelle

*/

ALTER Table Produkte
ADD ID int IDENTITY(1,1)


ALTER Table Kaufhistorie
ADD PRIMARY KEY (ID);

/*markdown
# Prüfen, obs erfolgreich war
*/

SELECT *
From Produkte

/*markdown
# Neu Anlegen der Tabelle Produkte mit den Spalten in der richtigen Reihenfolge
*/

begin transaction

SELECT *
INTO #tempTable
From Produkte;

drop table Produkte;

Create Table Produkte(
    ID int IDENTITY(1,1),
    Name nvarchar(max),
    "Preis" DECIMAL(10,2),
    PRIMARY KEY (ID)
)

SET IDENTITY_INSERT Produkte ON;

INSERT INTO Produkte(ID, Name, preis)
Select ID, Name, Preis
From #tempTable;

SET IDENTITY_INSERT Produkte OFF;

Select * 
From Produkte;

commit transaction;

/*markdown
# Prüfen, ob die TempTable auch weg ist
*/

Select * 
From #tempTable

/*markdown
# Prüfen, ob die Produkte Tabelle nun korrekt aussieht
*/


Select * 
From Produkte;

/*markdown
# Anlegen geeigneter Datensätze

*/

/*markdown
# Prüfen, obs erfolgreich war

*/