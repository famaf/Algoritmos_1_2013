type Nombre = String

agregar_senor :: Nombre -> String
agregar_senor n = "Sr. " ++ n

-- El tipo Dia y sus constructores
data Dia = Lunes | Martes | Miercoles | Jueves | Viernes
         deriving Show

data Profe = Damian | Martin
           deriving Show

queDias :: Profe -> [Dia]
queDias Damian = [Lunes,Jueves]
queDias Martin = [Miercoles]

presente :: Profe -> Dia -> Bool
presente Damian Lunes     = True
presente Damian Jueves    = True
presente Martin Miercoles = True
presente _      _         = False


-- pattern matching
hay_clases_de_algo1 :: Dia -> Bool
hay_clases_de_algo1 Lunes     = True
hay_clases_de_algo1 Martes    = False
hay_clases_de_algo1 Miercoles = True
hay_clases_de_algo1 Jueves    = True
hay_clases_de_algo1 Viernes   = False

-- pattern matching
hay_clases_de_algo1' :: Dia -> Bool
hay_clases_de_algo1' Lunes     = True
hay_clases_de_algo1' Miercoles = True
hay_clases_de_algo1' Jueves    = True
hay_clases_de_algo1' _         = False

hay_clases_de_lab :: Dia -> Bool
hay_clases_de_lab Miercoles = True
hay_clases_de_lab _         = False

{-
-- Esto no anda (todavia).
hay_clases_de_lab' :: Dia -> Bool
hay_clases_de_lab' d | d == Miercoles = True
                     | otherwise      = False
-}


-- TODO: agregarle genero con un tipo de dato en parametro.
data Genero  = Macho | Hembra
data Mascota = Perro Genero Nombre
             | Gato  Genero Nombre

articulo :: Genero -> String
articulo Macho  = "El"
articulo Hembra = "La"

oa :: Genero -> String
oa Macho  = "o"
oa Hembra = "a"

grito :: Mascota -> String

grito (Perro genero nombre) = articulo genero ++ " perr" ++ oa genero ++ " " ++ nombre ++ " ladra."

grito (Gato genero nombre)
   = articulo genero ++ " gat" ++ oa genero
     ++ " " ++ nombre ++ " maulla."

-- Volviendo a implementar listas.

data Lista a = Vacia             -- Lista vacia
             | Cons a (Lista a)  -- Lista compuesta
             deriving Show       -- Para que se imprima

type Cadena = Lista Char

longitudLista :: (Lista a) -> Int
longitudLista Vacia       = 0
longitudLista (Cons x xs) = 1 + longitudLista xs

{-
Ejemplos con Maybe
recuerdo :
data Maybe a = Nothing | Just a
-}

cabeza :: Lista a -> a
cabeza (Cons x _) = x

cabezaSegura :: Lista a -> Maybe a
cabezaSegura Vacia      = Nothing
cabezaSegura (Cons x _) = Just x


---------------
{-
Mas cosas con Maybe
maybeToList  :: Maybe a -> [a]
-}
