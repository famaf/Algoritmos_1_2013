data ListAssoc a b = Empty | Node a b (ListAssoc a b) deriving (Show)


mario :: ListAssoc a b -> [(a,b)]
mario Empty = []
mario (Node a b l) = [(a,b)] ++ mario l


marioaux :: [(a,b)] -> [(a,b)]
marioaux [] = []
marioaux ((a,b):xs) = reverse ((a,b):xs)


alan :: [(a,b)] -> ListAssoc a b
alan [] = Empty
alan ((a,b):xs) = (Node a b (alan xs))


atras :: ListAssoc a b -> ListAssoc a b
atras Empty = Empty
atras lista = alan (marioaux (mario lista))
