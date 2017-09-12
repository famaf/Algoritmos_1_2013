module Key ( Key,
             key_MaxLen,
             key_fromString,
             key_toString,
             key_length
           ) 
where

data Key = Value String Int



-- Máximo tamaño de la clave
key_MaxLen :: Int
key_MaxLen = 30



-- De un string construye una clave
-- El tamaño del string debe ser menor o igual a key_MaxLen
key_fromString :: String -> Key
key_fromString s | (length s) <= key_MaxLen = (Value s (length s))
                 | otherwise = undefined



-- Convierte una clave a string.
key_toString :: Key -> String
key_toString (Value s _) = s



-- Devuelve el tamaño de la clave
key_length :: Key -> Int
key_length (Value _ l) = l



-- Las claves se pueden comparar
instance Eq Key where
    Value s1 l1 == Value s2 l2 = s1 == s2 && l1 == l2

-- Las claves tienen orden
instance Ord Key where
    Value s1 l1 <= Value s2 l2 = l1 <= l2 && s1 <= s2

--Las claves se imprimen en pantalla
instance Show Key where
    show (Value s1 l1) = "Value " ++ s1 ++ " " ++ (show l1)
