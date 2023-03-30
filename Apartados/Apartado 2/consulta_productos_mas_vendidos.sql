Select nombre_producto from productos;
Select count(nombre_producto) from productos;
Select count(distinct nombre_producto) from productos;
Select * from pedidos;
Select * from detallepedidos;
Select * from detallepedidos
where cantidad > 5;


select * from productos 
where ProductoID in (Select * from detallepedidos
where cantidad > 5);
