# Con el in
select nombre_producto  
from productos 
where ProductoID in (Select ProductoID 
from detallepedidos
where cantidad > 5);
# con el join
SELECT distinct nombre_producto 
FROM productos
JOIN detallepedidos ON productos.`ProductoID` = detallepedidos.ProductoID
where detallepedidos.cantidad>5;
# Con el Exists
Select nombre_producto from productos
where exists (select * from detallepedidos where productos.`ProductoID` = detallepedidos.ProductoID 
and cantidad >5 );

# Con el Inner join 
SELECT distinct nombre_producto  as 'Inner Join'
FROM productos
inner JOIN detallepedidos ON productos.`ProductoID` = detallepedidos.ProductoID
where detallepedidos.cantidad>5;


