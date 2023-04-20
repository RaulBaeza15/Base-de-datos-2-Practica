START TRANSACTION;

UPDATE detallepedidos

Set descuento_unitario=descuento_unitario+1

WHERE PedidoID IN (SELECT PedidoID 

 FROM pedidos INNER JOIN detallespedidos ON pedidos.PedidoID=detallepedidos.PedidoID

INNER JOIN producto ON detallepedidos.productoID=producto.productoID 

INNER JOIN subcategoriaproducto ON productos.subcategoriaID=subcategoriaproducto.subcategoriaID

INNER JOIN categoriaproducto ON categoriaproducto.categoriaID=subcategoriaproducto.categoriaID

  WHERE YEAR(fecha_venta) = 2023

) AND nombre_categoria = 'Bicicleta' AND descuento_unitario > 0;

ROLLBACK;