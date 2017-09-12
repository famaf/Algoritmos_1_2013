module Dict ( Dict,
              Word,
              Def,
              dict_empty,
              dict_add,
              dict_exist,
              dict_search,
              dict_del,
              dict_length,
              dict_toDefs
            )
where

import Data
import Key
import Abb

data Dict = Dict Int (Abb Key Data) deriving Show

type Word = String
type Def  = String



-- Crea un diccionario vacio
dict_empty :: Dict
dict_empty = Dict 0 abb_empty



-- Pregunta si la clave esta en el diccionario
dict_exist :: Word -> Dict -> Bool
dict_exist palabra (Dict n l) = case (abb_search (key_fromString palabra) l) of
                                     Just _ -> True
                                     Nothing -> False


-- Agrega un dato con una key al diccionario
-- Si la clave ya está, no hace nada
-- (Agrega una palabra con su definicion al diccionario
-- Si la palabra está, no hace nada)
dict_add :: Word -> Def -> Dict -> Dict
dict_add palabra definicion (Dict n l) | dict_exist palabra (Dict n l) = (Dict n l)
                                       | otherwise = (Dict (n+1) (abb_add (key_fromString palabra) (data_fromString definicion) l))

{- Ayuda: usar dict_exist en una guarda -}


-- Devuelve el dato asociado a un diccionario
-- Si no está, devuelve Nothing
dict_search :: Word -> Dict -> Maybe Def
dict_search palabra (Dict n l) = convertidor (abb_search (key_fromString palabra) l)


--Convierte un "Maybe Data" en un "Maybe Def (Def = String)"
convertidor :: Maybe Data -> Maybe Def
convertidor Nothing = Nothing
convertidor (Just x) = (Just (data_toString x))


-- Borra un dato del diccionario de acuerdo a una clave
-- Si la clave no está, no hace nada
dict_del :: Word -> Dict -> Dict
dict_del palabra (Dict n l) = case (abb_search (key_fromString palabra) l) of
                                   (Just _) -> (Dict (n-1) (abb_del (key_fromString palabra) l))
                                   Nothing -> (Dict n l)


-- Devuelve la cantidad de datos en el diccionario
dict_length :: Dict -> Int
dict_length (Dict n l) = n



-- Devuelve las definiciones del diccionario
dict_toDefs :: Dict -> [(Word,Def)]
dict_toDefs (Dict n l) = map nuevas (abb_toListPair l)


--Convierte la tupla "(Key, Data)" en una tupla "(Word, Def)" (Donde Word y Def = String)
nuevas :: (Key, Data) -> (Word, Def)
nuevas (a, b) = ((key_toString a),(data_toString b))

{- Ayuda: usar map con una funcion definida localmente -}
