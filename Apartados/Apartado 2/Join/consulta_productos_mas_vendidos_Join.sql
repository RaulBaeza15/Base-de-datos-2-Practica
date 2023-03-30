# con el join
SELECT distinct nombre_producto 
FROM productos
JOIN detallepedidos ON productos.`ProductoID` = detallepedidos.ProductoID
where detallepedidos.cantidad>5;

# Count con el join
SELECT count(distinct nombre_producto) as "Join"
FROM productos
JOIN detallepedidos ON productos.`ProductoID` = detallepedidos.ProductoID
where detallepedidos.cantidad>5;
