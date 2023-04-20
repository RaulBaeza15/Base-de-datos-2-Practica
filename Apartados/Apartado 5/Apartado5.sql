select descuento_unitario+1 from detallepedidos
inner join pedidos on pedidos.PedidoID= detallepedidos.PedidoID
inner join productos on productos.ProductoID= detallepedidos.ProductoID
inner join subcategoriaproducto on productos.subcategoriaID=subcategoriaproducto.subCategoriaID
inner join categoriaproducto on categoriaproducto.categoriaID=subcategoriaproducto.categoriaID
where descuento_unitario <> 0 and
fecha_venta like '%2023%' 
and  nombre_categoria= 'bicicleta';


select *, descuento_unitario+1 from detallepedidos
where descuento_unitario<> 0
and PedidoID in(
        select PedidoID from pedidos
    where fecha_venta like '%2023%'
    and ProductoID in (select ProductoID from productos
inner join subcategoriaproducto on productos.subcategoriaID=subcategoriaproducto.subCategoriaID
where categoriaID in (select categoriaID from categoriaproducto
where nombre_categoria= 'bicicleta'))
        )
;
set sql_safe_updates =0;

START TRANSACTION;
select * from detallepedidos;
UPDATE detallepedidos SET descuento_unitario = descuento_unitario+1 WHERE ProductoID in (
select productos.ProductoID from productos
inner join pedidos on pedidos.PedidoID= detallepedidos.PedidoID
inner join productos on productos.ProductoID= detallepedidos.ProductoID
inner join subcategoriaproducto on productos.subcategoriaID=subcategoriaproducto.subCategoriaID
inner join categoriaproducto on categoriaproducto.categoriaID=subcategoriaproducto.categoriaID
where descuento_unitario <> 0 and
fecha_venta like '%2023%' 
and  nombre_categoria= 'bicicleta');
-- Aquí iría el código para verificar si todo está correcto, en caso de que no, usaríamos el comando ROLLBACK:
select * from detallepedidos;
ROLLBACK;
;
select detalle_pedidoID from detallepedidos
inner join pedidos on pedidos.PedidoID= detallepedidos.PedidoID
inner join productos on productos.ProductoID= detallepedidos.ProductoID
inner join subcategoriaproducto on productos.subcategoriaID=subcategoriaproducto.subCategoriaID
inner join categoriaproducto on categoriaproducto.categoriaID=subcategoriaproducto.categoriaID
where descuento_unitario <> 0 and
fecha_venta like '%2023%' 
and  nombre_categoria= 'bicicleta'