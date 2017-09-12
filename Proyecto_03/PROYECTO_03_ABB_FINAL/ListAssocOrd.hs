module ListAssocOrd ( ListAssoc,
                      la_empty,
                      la_add,
                      la_search,
                      la_del,
                      la_toListPair
                    )
where

data ListAssoc a b = Node a b (ListAssoc a b) | Empty deriving Show


-- Lista de asociaciones vacia
la_empty :: ListAssoc a b
la_empty = Empty



-- Agrega un elemento a una lista de asociaciones
-- Si ya está, puede hacer cualquier cosa 
la_add :: (Eq a, Ord a) => a -> b -> ListAssoc a b -> ListAssoc a b
la_add x y Empty = (Node x y Empty)
la_add x y (Node a b l) | x == a = (Node a y l)
                        | x < a = (Node x y (Node a b l))
                        | x > a = (Node a b (la_add x y l))



-- Devuelve el elemento asociado 
-- Si no está, devuelve Nothing
la_search :: (Eq a, Ord a) => a -> ListAssoc a b -> Maybe b
la_search x Empty = Nothing
la_search x (Node a b l) | x == a = Just b
                         | x < a = Nothing
                         | x > a = la_search x l



-- Borra un elemento a la lista de asociaciones 
-- Si no está, no hace nada
la_del :: (Eq a, Ord a) => a -> ListAssoc a b -> ListAssoc a b
la_del x Empty = Empty
la_del x (Node a b l) | x == a = l
                      | x < a = (Node a b l)
                      | x > a = (Node a b (la_del x l))



-- Devuelve la lista de pares correspondiente a la lista de asociaciones
la_toListPair :: ListAssoc a b -> [(a,b)]
la_toListPair Empty = []
la_toListPair (Node a b l) = [(a,b)] ++ la_toListPair l
