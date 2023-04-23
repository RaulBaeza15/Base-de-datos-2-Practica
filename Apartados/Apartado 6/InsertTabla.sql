INSERT INTO tabla_pedidos (pedidoID, primer_nombre, apellidos, territorioID, fecha_venta, total_pedido)
SELECT p.pedidoID, c.primer_nombre, c.apellidos, c.territorioID, p.fecha_venta, SUM((d.precio_unitario - d.descuento_unitario) * d.cantidad) AS total_pedido
FROM pedidos p
INNER JOIN clientes c ON p.clienteID = c.clienteID
INNER JOIN detallepedidos d ON p.pedidoID = d.pedidoID
GROUP BY p.pedidoID;
