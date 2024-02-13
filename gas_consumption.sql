-- Create a new database for quantum data
CREATE DATABASE quantum_db;
USE quantum_db;

-- Create a table 'gas_extendidas' for extended gas data
CREATE TABLE gas_extendidas (
    Nom_Agrupador VARCHAR(255),
    CIF_Client VARCHAR(255),
    CIF_UFC VARCHAR(255),
    Mes_emissio DATE,
    Clau_Agrupador VARCHAR(255),
    CUPS VARCHAR(255),
    Contracte VARCHAR(255),
    Denominacio_Subministrament VARCHAR(255),
    Sector VARCHAR(255),
    Tarifa_ATR VARCHAR(255),
    Numero_Factura VARCHAR(255) PRIMARY KEY,
    Data_Emissio DATE,
    Data_inici DATE,
    Data_fi DATE,
    Lectura_anterior_m3 INT,
    Lectura_actual_m3 INT,
    Consum_m3 INT,
    Factor_conversio DECIMAL(10, 7),
    Consum_kWh INT,
    Preu_Energia DECIMAL(10, 8),
    Import_Energia DECIMAL(10, 2),
    Terme_fix DECIMAL(10, 2),
    Lloguer DECIMAL(10, 2),
    Altres_conceptes DECIMAL(10, 2),
    IVA DECIMAL(10, 2),
    Import_Factura DECIMAL(10, 2),
    Indicador_de_Pagament VARCHAR(255)
);


-- Retrieve all records from 'gas_extendidas'
SELECT * FROM gas_extendidas;

-- Count the number of records in 'gas_extendidas'
SELECT COUNT(*) FROM gas_extendidas;

-- Alter the 'gas_extendidas' table by adding a new column 'ClientID'
ALTER TABLE gas_extendidas
ADD COLUMN ClientID INT;

-- Add a foreign key constraint linking 'ClientID' in 'gas_extendidas' to 'Clients' table
ALTER TABLE gas_extendidas
ADD FOREIGN KEY (ClientID) REFERENCES Clients(ClientID);

-- Update the 'gas_extendidas' table to set 'ClientID' based on a join with 'Clients' table
UPDATE gas_extendidas g
INNER JOIN Clients c ON g.CIF_Client = c.CIF_Client
SET g.ClientID = c.ClientID;

-- Select records from 'gas_extendidas' for a specific client within a date range
SELECT *
FROM gas_extendidas
WHERE CIF_Client = 'B84679935'
AND Data_Emissio BETWEEN '2022-01-05' AND '2022-09-20';
