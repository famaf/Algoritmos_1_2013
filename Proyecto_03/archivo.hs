-- Funciones que mantienen las listas ordenadas

data Lista a = Vacia
             | Cons a (Lista a)
             deriving Show

-- Mantenemos el invariante que la lista esta ordenada.

lista_add :: Ord a => Lista a -> a -> Lista a
lista_add Vacia nuevo = Cons nuevo Vacia
lista_add la@(Cons e1 l) nuevo | nuevo <= e1 = Cons nuevo la
                               | otherwise   = Cons e1 (lista_add l nuevo)



-- Sacamos provecho de que la lista esta ordenada.

lista_borrar :: Ord a => Lista a -> a -> Lista a
lista_borrar Vacia e = Vacia
lista_borrar la@(Cons e1 l) e2 | e1 == e2  = l
                               | e1 < e2   = Cons e1 (lista_borrar l e2)
                               | otherwise = la



-- La sintaxis la@(Cons e1 l) define `la` como nombre para (Cons e1 l).
