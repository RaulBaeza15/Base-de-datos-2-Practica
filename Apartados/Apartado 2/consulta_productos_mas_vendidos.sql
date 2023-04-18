# Con el In 0.094 sec / 0.000 sec
SELECT nombre_producto  as 'In'
from productos 
where ProductoID in (Select ProductoID 
from detallepedidos
where cantidad > 5);

# Con el Join 0.078 sec / 0.000 sec
SELECT distinct nombre_producto as 'Join'
FROM productos
JOIN detallepedidos ON productos.`ProductoID` = detallepedidos.ProductoID
where detallepedidos.cantidad>5;

# Con el Exists 0.094 sec / 0.000 sec
SELECT nombre_producto as 'Exists' from productos 
where exists (select * from detallepedidos where productos.`ProductoID` = detallepedidos.ProductoID 
and cantidad >5 );

# Con el Inner join 0.094 sec / 0.000 sec
SELECT distinct nombre_producto  as 'Inner Join'
FROM productos
inner JOIN detallepedidos ON productos.`ProductoID` = detallepedidos.ProductoID
where detallepedidos.cantidad>5;


