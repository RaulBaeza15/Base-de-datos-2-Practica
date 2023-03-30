Select nombre_producto from productos;
Select count(nombre_producto) from productos;
Select count(distinct nombre_producto) from productos;
Select * from pedidos;
Select * from detallepedidos;
Select * from detallepedidos
where cantidad > 5;


# Con el in
select nombre_producto  
from productos 
where ProductoID in (Select ProductoID 
from detallepedidos
where cantidad > 5);

# Count con el in
select count(nombre_producto  ) as "In"
from productos 
where ProductoID in (Select ProductoID 
from detallepedidos
where cantidad > 5);

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

# Con el Exists
Select nombre_producto from productos
where exists (select * from detallepedidos where productos.`ProductoID` = detallepedidos.ProductoID 
and cantidad >5 );
# Count Con el Exists
Select count(nombre_producto) as "Exists" from productos
where exists (select * from detallepedidos where productos.`ProductoID` = detallepedidos.ProductoID 
and cantidad >5 );

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

