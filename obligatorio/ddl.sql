--create database ObligatorioBDD

CREATE TABLE Turistas (
    id_pasajero NUMERIC(20) IDENTITY NOT NULL,
    nombre VARCHAR(20),
    apellido_paterno VARCHAR(20),
    apellido_materno VARCHAR(20),
    tipo_doc VARCHAR(5),
    documento NUMERIC(11),
    fecha_nacimiento DATE,
    email VARCHAR(30),
    pass VARCHAR(20) NULL,
    categoria VARCHAR(20),
    CONSTRAINT PK_TURISTAS PRIMARY KEY (id_pasajero),
    CONSTRAINT UQ_TURISTAS_DOCUMENTO UNIQUE (documento),
    CONSTRAINT UQ_TURISTAS_EMAIL UNIQUE (email)
);

CREATE TABLE Telefonos (
    nro_telefono NUMERIC(20) NOT NULL,
    id_pasajero NUMERIC(20) NOT NULL,
    CONSTRAINT PK_TEL PRIMARY KEY (nro_telefono, id_pasajero),
	CONSTRAINT UQ_TELEFONOS_TEL UNIQUE (nro_telefono),
    CONSTRAINT FK_TELEFONOS_TURISTAS FOREIGN KEY (id_pasajero) REFERENCES Turistas(id_pasajero)
);

CREATE TABLE Beneficios (
    id_beneficio NUMERIC(20) NOT NULL,
    descripcion VARCHAR(60),
    CONSTRAINT PK_BENEF PRIMARY KEY (id_beneficio)
);

CREATE TABLE Turista_Beneficio (
    id_pasajero NUMERIC(20) NOT NULL,
    id_beneficio NUMERIC(20) NOT NULL,
    CONSTRAINT PK_TURBEN PRIMARY KEY (id_pasajero, id_beneficio),
    CONSTRAINT FK_TURBEN_TURISTAS FOREIGN KEY (id_pasajero) REFERENCES Turistas(id_pasajero),
    CONSTRAINT FK_TURBEN_BENEFICIOS FOREIGN KEY (id_beneficio) REFERENCES Beneficios(id_beneficio)
);


CREATE TABLE Buses (
    id_bus NUMERIC(20) IDENTITY NOT NULL,
    marca VARCHAR(15),
    tipo VARCHAR(15),
    cap_asientos NUMERIC(2),
    CONSTRAINT PK_BUS PRIMARY KEY (id_bus)
);


CREATE TABLE Departamentos (
    id_departamento NUMERIC(20) IDENTITY NOT NULL,
    nombre VARCHAR(50),
    CONSTRAINT PK_DEP PRIMARY KEY (id_departamento)
);


CREATE TABLE Terminales (
    id_terminal NUMERIC(20) IDENTITY NOT NULL,
    nombre VARCHAR(25),
    id_depto NUMERIC(20),
    CONSTRAINT PK_TER PRIMARY KEY (id_terminal),
    CONSTRAINT FK_TERMINALES_DEPARTAMENTOS FOREIGN KEY (id_depto) REFERENCES Departamentos(id_departamento)
);


CREATE TABLE Destinos_Turisticos (
    id_destino NUMERIC(20) NOT NULL,
    t_origen NUMERIC(20),
    t_destino NUMERIC(20),
    importe NUMERIC(10),
    fecha_hora DATETIME,
    duracion_aprox NUMERIC(10),
    id_bus NUMERIC(20),
    CONSTRAINT PK_DEST PRIMARY KEY (id_destino),
    CONSTRAINT FK_DESTINOS_BUSES FOREIGN KEY (id_bus) REFERENCES Buses(id_bus),
	CONSTRAINT FK_DESTINOS_T_OG FOREIGN KEY (t_origen) REFERENCES Terminales(id_terminal),
	CONSTRAINT FK_DESTINOS_T_DES FOREIGN KEY (t_destino) REFERENCES Terminales(id_terminal)
);

CREATE TABLE Asientos (
    nro_fila NUMERIC(2) NOT NULL,
    letra VARCHAR(1) NOT NULL,
    id_bus NUMERIC(20) NOT NULL,
    CONSTRAINT PK_ASIENTOS PRIMARY KEY (nro_fila, letra, id_bus),
    CONSTRAINT FK_ASIENTOS_BUSES FOREIGN KEY (id_bus) REFERENCES Buses(id_bus)
);

CREATE TABLE Pasajes (
    id_pasaje NUMERIC(20) IDENTITY NOT NULL,
    estado VARCHAR(20), -- 'utilizado' o 'no utilizado'
    id_pasajero NUMERIC(20),
    id_destino NUMERIC(20),
	fecha_compra DATE,
	nro_fila_asiento NUMERIC(2),
	letra_asiento VARCHAR(1),
	id_bus NUMERIC(20),
    CONSTRAINT PK_PASAJES PRIMARY KEY (id_pasaje),
	CONSTRAINT CK_PASAJE_ESTADO CHECK (estado in ('utilizado', 'no utilizado')),
    CONSTRAINT FK_PASAJES_TURISTAS FOREIGN KEY (id_pasajero) REFERENCES Turistas(id_pasajero),
    CONSTRAINT FK_PASAJES_DESTINOS FOREIGN KEY (id_destino) REFERENCES Destinos_Turisticos(id_destino),
	CONSTRAINT FK_ASIENTOS FOREIGN KEY (nro_fila_asiento, letra_asiento, id_bus) REFERENCES Asientos(nro_fila, letra, id_bus)
);


