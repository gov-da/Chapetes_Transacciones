use chapetes;

-- 1. (compra de insumos)
--Levantar Transaccion 
 begin transaction

-- Insertar la compra en detalle_compras
insert into detalle_compras (id_almacen, id_proveedor, id_magnitud, cantidad, precio)
values (2, 4, 1, 10, 120.00)

-- Actualizar el inventario en almacen
update almacen
set cantidad = cantidad + 10
where id_almacen = 2

--Confirmar
 commit transaction


 -- 2. (cambiar estado de orden)
--Levantar Transaccion
begin transaction

-- actualizar el estado de la orden en ordenes
update ordenes
set id_estado = 3
where id_orden = 8

-- registrar el cambio de estado en detalle_ordenes_estados
insert into detalle_ordenes_estados (id_orden, id_estado, hora)
values (15, 3, getdate())

--Confirmar
commit transaction



-- 3. (uso de insumos)
--Levantar transaccion 
begin transaction

-- actualizar la cantidad de insumos utilizados en almacen
update almacen
set cantidad = cantidad - 5 
where id_almacen = 2

update almacen
set cantidad = cantidad - 20 
where id_almacen = 1

-- registrar el uso en detalle_almacen_producto
insert into detalle_usos(id_almacen, id_producto, cantidad, id_magnitud)
values 
(2, 2, 5, 1),
(1, 2, 20, 5)

commit transaction

-- 4.(Agregar producto nuevo)
--Levantar transaccion
begin transaction

-- insertar el nuevo producto
insert into productos (id_categoria, id_disponibilidad, nombre, descripcion, precio, cantidad_existencia)
values (1, 1, 'flan ', 'postre cremoso con caramelo', 35.00, 50)

--confirmar
commit transaction


-- 5. (Actualizar Stock)
-- Levantar transaccion
begin transaction

-- Actualizar la cantidad de un producto en el inventario
update almacen
set cantidad = cantidad - 2
where id_almacen = 3

-- Confirmar 
commit transaction
