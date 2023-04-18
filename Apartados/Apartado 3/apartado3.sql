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
    
