SELECT p.nombre_producto, COUNT(*) AS num_pedidos
FROM productos p
INNER JOIN subcategoriaproducto s
    ON p.subcategoriaID = s.subCategoriaID
INNER JOIN categoriaproducto c
    ON s.categoriaID = c.categoriaID
INNER JOIN detallepedidos d
    ON p.ProductoID = d.ProductoID
WHERE c.nombre_categoria = 'Componente'
    AND s.nombre_subcategoria LIKE '%Cuadro%'
    AND p.color = 'Blue'
GROUP BY p.nombre_producto
HAVING COUNT(*) > (
    SELECT COUNT(*)
    FROM subcategoriaproducto sc
    INNER JOIN productos pd
        ON sc.subCategoriaID = pd.subcategoriaID
    INNER JOIN detallepedidos dp
        ON pd.ProductoID = dp.ProductoID
    WHERE sc.nombre_subcategoria IN ('Dirección', 'Horquilla')
    );
select * from categoriaproducto cat
where cat.nombre_categoria='Componente';
select * from subcategoriaproducto subcat
where subcat.nombre_subcategoria  LIKE '%Cuadro%';
select * from productos prod
where prod.color='blue';
select * from subcategoriaproducto subcat
where subcat.nombre_subcategoria = 'Dirección';
select * from subcategoriaproducto subcat
where subcat.nombre_subcategoria  = 'Horquilla';

select * from productos prod 
where prod.subcategoriaID in (select subcat.subcategoriaID from subcategoriaproducto subcat
where subcat.nombre_subcategoria  = 'Horquilla'); 

select dtllp.ProductoID, count(distinct dtllp.pedidoId) 
from detallepedidos dtllp
WHERE dtllp.ProductoID in (
	select prod.ProductoID from productos prod 
	where prod.subcategoriaID in (
		select subcat.subcategoriaID from subcategoriaproducto subcat
		where subcat.nombre_subcategoria  = 'Dirección'))
GROUP BY dtllp.ProductoID;
            
select dtllp.ProductoID, count(distinct dtllp.pedidoId) 
from detallepedidos dtllp
WHERE dtllp.ProductoID in (
	select prod.ProductoID from productos prod 
	where prod.subcategoriaID in (
		select subcat.subcategoriaID from subcategoriaproducto subcat
		where subcat.nombre_subcategoria  = 'Horquilla'))
GROUP BY dtllp.ProductoID;


 
