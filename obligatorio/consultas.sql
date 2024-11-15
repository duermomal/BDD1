/*
1. Listar el o los nombres de los pasajeros con la mayor cantidad de pasajes comprados a
su nombre.
*/

select top 1 with ties 
	tur.nombre, 
	count(pas.id_pasajero) cant_pasajes  
from Turistas tur 
	join Pasajes pas on tur.id_pasajero = pas.id_pasajero 
	group by  tur.nombre, tur.id_pasajero
	order by count(pas.id_pasajero) desc
	
/*
2. Listar todos los datos de los buses con mas de 35 asientos que no tengan asignado
ningun destino que parta el dia de mañana.
*/

select bus.* 
from buses bus
join Destinos_Turisticos dt on bus.id_bus = dt.id_bus
 where bus.cap_asientos > 35 and dt.fecha_hora <> getdate()+1

/*
3. Listar todos los datos de los pasajeros para los cuales haya registrados en el sistema
mas de 5 pasajes comprados.
*/

select 
	tur.id_pasajero, 
	tur.nombre, 
	tur.apellido_paterno, 
	tur.apellido_materno,
	tur.tipo_doc,
	tur.documento,
	tur.fecha_nacimiento,
	tur.email,
	tur.pass, 
	tur.categoria,
	count(tur.id_pasajero) pasajes_comprados
from turistas tur  
	join Pasajes pas on tur.id_pasajero = pas.id_pasajero
		group by 
		tur.id_pasajero, 
		tur.nombre,
		tur.apellido_paterno,
		tur.apellido_materno,
		tur.tipo_doc,
		tur.documento,
		tur.fecha_nacimiento,
		tur.email,
		tur.pass, 
		tur.categoria
		having count(tur.id_pasajero) > 5


/*
4. Listar idpasajero, nombre, apellidos y asiento (idasiento y fila) que correspondan a
pasajes comprados para el destino cuyo idviaje es 255.
*/

select 
	pas.id_pasajero, 
	tur.nombre, 
	tur.apellido_paterno, 
	tur. apellido_materno, 
	concat(asi.letra, '-', asi.nro_fila) asiento 
from Turistas tur
	join Pasajes pas on tur.id_pasajero = pas.id_pasajero
	join Asientos asi on asi.id_bus = pas.id_bus and asi.letra = pas.letra_asiento and asi.nro_fila = pas.nro_fila_asiento
		where pas.id_destino = 255
/*
5. Listar todos los idviaje y cantidad de pasajes comprados durante el mes de Setiembre de
este año para c/u de los destinos del pasajero cuyo correo es soyturista@gmail.com
comprados en Setiembre del 2017. La lista debe estar ordenada por idviaje ascendente.
*/

select 
dt.id_destino, 
count(pas.id_pasaje) cant_pasajes, 
left(pas.fecha_compra, 7) anio_mes_compra 
from Turistas tur 
join Pasajes pas on tur.id_pasajero = pas.id_pasajero
join Destinos_Turisticos dt on dt.id_destino = pas.id_destino
where 
	tur.email = 'soyturista@gmail.com' 
	and year(pas.fecha_compra) = year(getdate()) 
	and month(pas.fecha_compra) = 9
group by dt.id_destino, left(pas.fecha_compra, 7) 
order by dt.id_destino asc