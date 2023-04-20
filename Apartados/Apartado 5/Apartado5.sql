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