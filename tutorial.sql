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
    Dateum date,
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
# Die Ursprüngliche Präzision haben wir verloren. Diese stellen wir nun wieder her mit dem Update Befehl und ändern den bestehenden Preis der Milch zuurück auf den Präzisen Wert von Preis = 1,99 €
*/

UPDATE Produkte
SET Preis = 1.99
WHERE Name = 'Milch'