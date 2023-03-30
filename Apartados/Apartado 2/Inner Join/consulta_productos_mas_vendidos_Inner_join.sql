# Con el Inner join 
SELECT distinct nombre_producto 
FROM productos
inner JOIN detallepedidos ON productos.`ProductoID` = detallepedidos.ProductoID
where detallepedidos.cantidad>5;

# Count Con el Inner join 
SELECT count(distinct nombre_producto) as "Inner join"
FROM productos
inner JOIN detallepedidos ON productos.`ProductoID` = detallepedidos.ProductoID
where detallepedidos.cantidad>5;
