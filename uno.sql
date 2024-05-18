-- Crear el tipo compuesto Direccion
CREATE TYPE Direccion AS (
    Ciudad VARCHAR(100),
    Direccion VARCHAR(200)
);

CREATE TABLE Cliente (
    Identificacion VARCHAR(50) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Direccion Direccion,
    Email VARCHAR(100),
    Telefono VARCHAR(20)
);

CREATE TABLE Usuario (
    Login VARCHAR(50) PRIMARY KEY,
    Contrasena VARCHAR(50) NOT NULL,
    Direccion Direccion,
    Email VARCHAR(100),
    Telefono VARCHAR(20),
    Cliente_ID VARCHAR(50),
    FOREIGN KEY (Cliente_ID) REFERENCES Cliente(Identificacion)
);

CREATE TABLE Mensajero (
    Identificacion VARCHAR(50) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Direccion Direccion,
    Email VARCHAR(100),
    Telefono VARCHAR(20)
);


CREATE TABLE Servicio (
    Codigo INT AUTO_INCREMENT PRIMARY KEY,
    FechaHoraSolicitud DATETIME NOT NULL,
    Origen Direccion,
    Destino Direccion,
    Descripcion TEXT,
    TipoTransporte ENUM('moto', 'carro', 'camion') NOT NULL,
    NumPaquetes INT,
    Usuario_Login VARCHAR(50),
    Mensajero_ID VARCHAR(50),
    FOREIGN KEY (Usuario_Login) REFERENCES Usuario(Login),
    FOREIGN KEY (Mensajero_ID) REFERENCES Mensajero(Identificacion)
);


CREATE TABLE Estado (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Estado ENUM('solicitado', 'recogido', 'entregado') NOT NULL,
    FechaHora DATETIME NOT NULL,
    Foto BLOB,
    Servicio_Codigo INT,
    FOREIGN KEY (Servicio_Codigo) REFERENCES Servicio(Codigo)
);

INSERT INTO Cliente (Identificacion, Nombre, Direccion, Email, Telefono)
VALUES ('12345', 'Cliente A', '{"Ciudad": "Bogotá", "Direccion": "Calle 123 #45-67"}', 'clientea@example.com', '123456789');
