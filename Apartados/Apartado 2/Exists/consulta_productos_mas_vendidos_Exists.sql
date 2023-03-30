# Con el Exists
Select nombre_producto from productos
where exists (select * from detallepedidos where productos.`ProductoID` = detallepedidos.ProductoID 
and cantidad >5 );
# Count Con el Exists
Select count(nombre_producto) as "Exists" from productos
where exists (select * from detallepedidos where productos.`ProductoID` = detallepedidos.ProductoID 
and cantidad >5 );