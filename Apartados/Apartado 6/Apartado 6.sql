SELECT c.primer_nombre, c.apellidos, c.territorioID, p.fecha_venta, SUM((d.precio_unitario - d.descuento_unitario) * d.cantidad) AS total_pedido
FROM pedidos p
INNER JOIN clientes c ON p.clienteID = c.clienteID
INNER JOIN detallepedidos d ON p.pedidoID = d.pedidoID
GROUP BY p.pedidoID;

