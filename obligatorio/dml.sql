-- Insertar datos en Turistas
INSERT INTO Turistas (nombre, apellido_paterno, apellido_materno, tipo_doc, documento, fecha_nacimiento, email, pass, categoria)
VALUES 
('Carlos', 'Perez', 'Gomez', 'DNI', 12345678, '1990-05-14', 'carlos.perez@example.com', 'pass123', 'Mercosur'),
('Ana', 'Lopez', 'Diaz', 'DNI', 87654321, '1985-11-23', 'ana.lopez@example.com', 'pass456', 'EEUU'),
('Juan', 'Garcia', 'Romero', 'DNI', 11223344, '1992-08-30', 'juan.garcia@example.com', 'pass789', 'Europa'),
('Juan', 'Prato', 'Romero', 'CI', 125454758, '1999-08-30', 'soyturista@gmail.com', 'pass78329', 'Mercosur');

-- Insertar datos en Telefonos
INSERT INTO Telefonos (nro_telefono, id_pasajero)
VALUES 
(987654321, 1), 
(123456789, 2), 
(456789123, 3);

-- Insertar datos en Beneficios
INSERT INTO Beneficios (id_beneficio, descripcion)
VALUES 
(1, 'Descuento 10% en pasajes'),
(2, 'Acceso a sala VIP'),
(3, 'Prioridad en embarque');

-- Insertar datos en Turista_Beneficio
INSERT INTO Turista_Beneficio (id_pasajero, id_beneficio)
VALUES 
(1, 1), 
(2, 2), 
(3, 3);

-- Insertar datos en Buses
INSERT INTO Buses (marca, tipo, cap_asientos)
VALUES 
('Volvo', 'Semi-cama', 40),
('Mercedes', 'Cama', 30),
('Mercedes', 'Semi-Cama', 36),
('Mercedes', 'Loft', 40),
('Volvo', 'Loft', 39);

-- Insertar datos en Departamentos
INSERT INTO Departamentos(nombre)
VALUES ('Lima'), ('Cusco'), ('Arequipa'), ('Montevideo'), ('Mallorca');

-- Insertar datos en Terminales
INSERT INTO Terminales (nombre,id_depto)
VALUES 
('Terminal Lima',  1),
('Terminal Cusco',  2),
('Terminal Arequipa', 3),
('Terminal Montevideo',  4),
('Terminal Mallorca', 5);


-- Insertar datos en Destinos_Turisticos
INSERT INTO Destinos_Turisticos (id_destino, t_origen, t_destino, importe, fecha_hora, duracion_aprox, id_bus)
VALUES 
(1, 1, 2, 100.50, '2024-11-15 08:30:00', 8, 1),
(2, 2, 3, 150.75, '2024-11-16 10:00:00', 10, 2),
(3, 3, 4, 1530.75, '2026-11-14 10:00:00', 102, 3),
(4, 4, 1, 2150.75, '2024-11-13 10:00:00', 110, 4),
(255, 2, 5, 1520.75, '2024-11-16 10:00:00', 10, 5);

-- Insertar datos en Asientos
INSERT INTO Asientos (nro_fila, letra, id_bus)
VALUES 
(11, 'C', 3), 
(5, 'A', 4), 
(7, 'D', 5), 
(8, 'B', 5),
(1, 'A', 1), 
(1, 'B', 1), 
(2, 'A', 2), 
(2, 'B', 2);



-- Insertar datos en Pasajes
INSERT INTO Pasajes (estado, id_pasajero, id_destino, fecha_compra, nro_fila_asiento, letra_asiento, id_bus)
VALUES 
('utilizado', 1, 1, '20241108' ,1, 'A', 1),
('no utilizado', 2, 255, '20241109',1, 'B', 1),
('utilizado', 3, 3,'20240108', 2, 'A', 2),
('no utilizado', 1, 4, '20241103', 2, 'B', 2),
('no utilizado', 3, 2,'20241208', 5, 'A', 4),
('no utilizado', 3, 1, '20221108', 7, 'D', 5),
('no utilizado', 3, 3, '20240606', 8, 'B', 5),
('no utilizado', 3, 255,'20240208', 11, 'C', 3),
('utilizado', 3, 255, '20240412', 1, 'A', 1),
('utilizado', 4, 1, '20240912', 1, 'A', 1),
('utilizado', 4, 2, '20240920', 1, 'A', 1),
('utilizado', 4, 3, '20240924', 1, 'A', 1),
('utilizado', 4, 4, '20240412', 1, 'A', 1),
('no utilizado', 4, 2, '20240912', 1, 'B', 1),
('no utilizado', 4, 2, '20240929', 7, 'D', 5)
;




