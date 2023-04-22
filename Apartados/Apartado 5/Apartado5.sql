START TRANSACTION;
select * from detallepedidos where descuento_unitario = 100;
UPDATE detallepedidos
SET descuento_unitario = descuento_unitario+1
WHERE PedidoID IN (
    SELECT PedidoID
    FROM pedidos
    WHERE YEAR(fecha_venta) = 2023
)
AND ProductoID IN (
    SELECT ProductoID
    FROM productos
    WHERE subcategoriaID IN (
        SELECT subCategoriaID
        FROM subcategoriaproducto
        WHERE nombre_subcategoria like '%Bicicleta%'
    )
    
)AND descuento_unitario <> 0;
select * from detallepedidos ;

-- Aquí iría cualquier otra operación que quieras realizar en la transacción
ROLLBACK;
-- Si todo va bien, hacemos COMMIT para confirmar los cambios
#COMMIT;
