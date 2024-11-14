-- Tema: Transacciones
-- Autor: Daniel Gómez Villaseñor
-- Fecha: 13-11-2024

use chapetes

-- 1. Agregar un nuevo proveedor
begin transaction
insert proveedores (nombre, telefono, calle, numero, colonia, municipio, id_tipo_proveedor) values
('Materias primas Marta', '3531234567', 'Juarez', 162, 'Centro', 'Sahuayo', 5);
-- Aceptar la transacción
commit transaction
-- Rechazar la transacción
rollback transaction

-- 2. Actualizar el sueldo de los empleados
begin transaction
update cargos
set sueldo = 300
where id_cargo = 1 and id_cargo = 2;
update cargos
set sueldo = 350
where id_cargo = 3;
update cargos
set sueldo = 400
where id_cargo = 4;
select * from cargos
-- Aceptar la transacción
commit transaction
-- Rechazar la transacción
rollback transaction

-- 3. Eliminar el detalle de orden cuyo id_orden_producto = 23
begin transaction
delete detalle_ordenes
where id_orden_producto = 23;
-- Aceptar la transacción
commit transaction
-- Rechazar la transacción
rollback transaction

-- 4. Actualizar la cantidad de productos en existencia a 0 cuyo id_producto = 1
-- Comienzo de la transacción
begin transaction
-- Actualizar la cantidad de productos a 0
update productos
set cantidad_existencia = 0
where id_producto = 1;
-- Actualizar la existencia a Agotado
update productos
set id_disponibilidad = 2
where id_producto = 1
-- Aceptar la transacción
commit transaction
-- Rechazar la transacción
rollback transaction

-- 5. Agregar un nuevo cliente
begin transaction
--Agregar al domicilio
insert domicilios (calle, num_casa, colonia, referencia) values
('Querétaro', 253, 'Las brisas', 'Cerca del gym')
--Agregar al cliente 
insert clientes (id_domicilio, nombre, numero_celular) values 
(11, 'Ricardo Suárez García', '3531234599')

-- Bloqueos
Execute sp_lock