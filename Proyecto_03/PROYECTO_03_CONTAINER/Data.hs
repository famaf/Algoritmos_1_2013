module Data ( Data,
              data_fromString,
              data_toString,
              data_length
            )
where

data Data = Value String Int


-- De un string construye una Data
-- Almacena el tamaño
data_fromString :: String -> Data
data_fromString s = Value s (length s)



-- Convierte una dato a string
data_toString :: Data -> String
data_toString (Value s l) = s



-- Devuelve el tamaño del dato
data_length :: Data -> Int
data_length (Value s l) = l



instance Show Data where
    show (Value s l) = s
