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