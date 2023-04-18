select dtllp.ProductoID, count(distinct dtllp.pedidoId) 
from detallepedidos dtllp
WHERE dtllp.ProductoID in (
	select prod.ProductoID from productos prod
	where prod.color='blue' 
    and prod.subcategoriaID in (
		select subcat.subcategoriaID from subcategoriaproducto subcat
		where subcat.nombre_subcategoria  LIKE '%Cuadro%'
		and subcat.categoriaID in (
			select cat.categoriaID from categoriaproducto cat ignore index(categoria_nombrecategoria)
			where cat.nombre_categoria='Componente')))
GROUP BY dtllp.ProductoID
HAVING count(distinct dtllp.pedidoId)>=all (
	select count(distinct dtllp.pedidoId) 
	from detallepedidos dtllp
	WHERE dtllp.ProductoID in (
		select prod.ProductoID from productos prod 
		where prod.subcategoriaID in (
			select subcat.subcategoriaID from subcategoriaproducto subcat
			where subcat.nombre_subcategoria  = 'Horquilla'))
	GROUP BY dtllp.ProductoID) 
or count(distinct dtllp.pedidoId) >= all(
	select  count(distinct dtllp.pedidoId) 
	from detallepedidos dtllp
	WHERE dtllp.ProductoID in (
		select prod.ProductoID from productos prod 
		where prod.subcategoriaID in (
			select subcat.subcategoriaID from subcategoriaproducto subcat
			where subcat.nombre_subcategoria  = 'Dirección'))
	GROUP BY dtllp.ProductoID);