module Abb ( Abb,
             abb_empty,
             abb_add,
             abb_search,
             abb_del,
             abb_toListPair)
where

data Abb a b = Rama a b (Abb a b) (Abb a b) | Hoja deriving Show


-- Arbol vacio
abb_empty :: Abb a b
abb_empty = Hoja



-- Agrega un elemento al abb
-- Si ya está, no lo agrega 
abb_add :: Ord a => a -> b -> Abb a b -> Abb a b
abb_add x y Hoja = (Rama x y Hoja Hoja)
abb_add x y (Rama a b arb1 arb2) | x == a = (Rama a y arb1 arb2)
                                 | x > a =  (Rama a b arb1 (abb_add x y arb2))
                                 | x < a =  (Rama a b (abb_add x y arb1) arb2)



-- Devuelve el elemento asociado 
-- Si no está, devuelve Nothing
abb_search :: Ord a => a -> Abb a b -> Maybe b
abb_search x Hoja = Nothing
abb_search x (Rama a b arb1 arb2) | x == a = Just b
                                  | x < a = (abb_search x arb1)
                                  | x > a = (abb_search x arb2)

-----------------------------------------------------------------------
-- Borra un elemento del arbol 
-- Si no está, no hace nada

abb_del  :: (Ord a) => a -> Abb a b -> Abb a b
abb_del x Hoja = Hoja 
abb_del x (Rama a b arb1 Hoja) | x == a = arb1 
abb_del x (Rama a b Hoja arb2) | x == a = arb2
abb_del x (Rama a b  arb1 arb2)| x < a  = Rama a b  (abb_del x arb1) arb2 
                               | x > a  = Rama a b  arb1 (abb_del x arb2)  
                               | x == a = Rama m (elem_asoc (abb_search m (Rama a b arb1 arb2)))  arb1 (abb_del m arb2)
                               where m = menor arb2

-- Dado un árbol devuelve el minimo elemento
menor :: Ord a => Abb a b -> a
menor (Rama a _ Hoja _) = a
menor (Rama _ _ arb1 _) = menor arb1

--Transforma el tipo Maybe y devuelve solo el elemento
elem_asoc :: Maybe a -> a
elem_asoc (Just x) = x
-----------------------------------------------------------------------


-- Devuelve la lista de pares correspondiente de los elementos
-- almacenados en el arbol
abb_toListPair :: Abb a b -> [(a,b)]
abb_toListPair Hoja = [] 
abb_toListPair (Rama a b arb1 arb2) = (abb_toListPair arb1) ++ [(a,b)] ++ (abb_toListPair arb2)
