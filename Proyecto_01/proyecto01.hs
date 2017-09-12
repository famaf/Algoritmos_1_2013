-------------------------------------------------
------------------ EJERCICIO 1 ------------------
-------------------------------------------------
{-
(A)
Dada una lista de valores "R" : [A]" y un predicado "T : A -> Bool" determina
si todos los elementos en "R" hacen verdadero el predicado "T".
-}
paratodo :: [a] -> (a -> Bool) -> Bool
paratodo [] t = True
paratodo (x:xs) t = t x && paratodo xs t

{-
(B)
Dada una lista de valores "R" : [A]" y un predicado "T : A -> Bool", determina
si algun elemento en "R" hacen verdadero el predicado "T".
-}
existe :: [a] -> (a -> Bool) -> Bool
existe [] t = False
existe (x:xs) t = t x || existe xs t

{-
(C)
Dada una lista de valores "R : [A]" y un función "T : A -> Int", calcula la
suma de la aplicación de "T" a los elementos en "R".
-}
sumatoria :: [a] -> (a -> Int) -> Int
sumatoria [] t = 0
sumatoria (x:xs) t = t x + sumatoria xs t

{-
(D)
Dada una lista de valores "R : [A]" y un función "T : A -> Int", calcula el
producto de la aplicación de "T" a los elementos de "R".
-}
productoria :: [a] -> (a -> Int) -> Int
productoria [] t = 1
productoria (x:xs) t = t x * productoria xs t

----------------- PUNTO * 1 -----------------
--(A)--
sumatoria' :: Num a => [t] -> (t -> a) -> a
sumatoria' [] t = 0
sumatoria' (x:xs) t = t x + sumatoria' xs t

--(B)--
productoria' :: Num a => [t] -> (t -> a) -> a
productoria' [] t = 1
productoria' (x:xs) t = t x * productoria' xs t


-------------------------------------------------
------------------ EJERCICIO 2 ------------------
-------------------------------------------------

{-
(A)
Dada una lista de enteros, devuelve verdadaro si todos los elementos son pares.
-}
todosPares :: [Int] -> Bool
todosPares y = paratodo y even

{-
(B)
Dado un entero y una lista de enteros, devuelve verdadero si hay algún número
en la lista que es múltiplo del primer número ingresado.
-}
hayMultiplo :: Int -> [Int] -> Bool
hayMultiplo y g = existe g (auxmultiplo y)

                where
                auxmultiplo x y | (mod y x == 0) = True
                                | otherwise = False 

{-
(C)
Dado un número no negativo "n" devuelve la suma de los primeros "n" cuadrados.
-}
sumaCuadrados :: Int -> Int
sumaCuadrados n = sumatoria [1..(n-1)] (^2)


-------------------------------------------------
------------------ EJERCICIO 3 ------------------
-------------------------------------------------

{-
LAS FUNCIONES DEL EJERCICIO 1 FUERON VERIFICADAS SATISFACTORIAMENTE PARA LOS
CASOS DE RANGO VACIO Y RANGO UNITARIO.

Ejemplos:

*Main> paratodo [] (>2)
True
*Main> paratodo [4] (>2)
True
*Main> existe [] (==2)
False
*Main> existe [2] (==2)
True
*Main> sumatoria [] (+2)
0
*Main> sumatoria [1] (+2)
3
*Main> productoria [] (*4)
1
*Main> productoria [5] (*4)
20
-}


-------------------------------------------------
------------------ EJERCICIO 4 ------------------
-------------------------------------------------

{-
Función que toma como argumento un operador, su neutro, una lista
(rango de la cuantificación) y una función (término de la cuantificación),apica
el operador a los elementos del rango transformandos por la funcion (termino).
-}
cuantGen :: (b -> b -> b) -> b -> [a] -> (a -> b) -> b
cuantGen op z [] t = z
cuantGen op z (x:xs) t = (t x) `op` (cuantGen op z xs t)


-------------------------------------------------
------------------ EJERCICIO 5 ------------------
-------------------------------------------------

-- Funciones del EJERCICIO 2, pero utilizando la funcion cuantGen:

--(A)--
todosPares' y = cuantGen (&&) True y even

--(B)--
hayMultiplo' y g = cuantGen (||) False g (auxmultiplo' y)

                where
                auxmultiplo' y x | (mod y x == 0) = True
                                 | otherwise = False

--(C)--
sumaCuadrados' n = cuantGen (+) 0 [1..(n-1)] (^2)

-------------------------------------------------
------------------ EJERCICIO 6 ------------------
-------------------------------------------------

{-
(A)
Dado un numero y una lsita de numeros, suma a cada elemento de la lista el
primer parametro.
-}
sumarALista :: Num a => a -> [a] -> [a]
sumarALista y [] = []
sumarALista y (x:xs) = (x + y) : sumarALista y xs

{-
Dada una expresion del tipo "a", lo pone en la cabeza de cada lista del
segundo parametro.
-}
encabezar :: a -> [[a]] -> [[a]]
encabezar y [] = []
encabezar y (x:xs) = (y : x) : encabezar y xs

--(B)--
sumarALista' :: Num a => a -> [a] -> [a]
sumarALista' y [] = []
sumarALista' y (x:xs) = map (+y) (x:xs)


encabezar' :: a -> [[a]] -> [[a]]
encabezar' y [] = []
encabezar' y (x:xs) = map (y:) (x:xs)


-------------------------------------------------
------------------ EJERCICIO 7 ------------------
-------------------------------------------------

{-
(A)
Dada una lista de numeros, devuelve aquellos que son pares.
-}
devuelvePares :: [Int] -> [Int]
devuelvePares [] = []
devuelvePares (x:xs) | mod x 2 == 0 = x : devuelvePares xs
                     | otherwise = devuelvePares xs

---(B)---
devuelvePares' :: [Int] -> [Int]
devuelvePares' [] = []
devuelvePares' (x:xs) = filter even (x:xs)


-------------------------------------------------
------------------ EJERCICIO 8 ------------------
-------------------------------------------------

{-
Dado un valor del tipo "Int" y una lista de pares "[(Int, String)]", devuelve
el segundo componente del primer par cuyo primer componente es igual al
primer parametro.
-}
encuentra :: Int -> [(Int, String)] -> String
encuentra y [] = ""
encuentra y ((x,z):xs) | x == y = z
                       | otherwise = encuentra y xs


-------------------------------------------------
------------------ EJERCICIO 9 ------------------
-------------------------------------------------

{-
(A)
Dado un valor y una lista, devuelve el tramo inicial mas largo de la lista
cuyos elementos son iguales al valor.
-}
primIgualesA :: Eq a => a -> [a] -> [a]
primIgualesA y [] = []
primIgualesA y (x:xs) | y == x = x : primIgualesA y xs
                      | otherwise = []


--(B)--
primIgualesA' :: Eq a => a -> [a] -> [a]
primIgualesA' y z = takeWhile ( == y) z

{-
(C)
Dada una lista, devuelve el mayor tramo inicial de la lista cuyos elementos son
todos iguales entre si.
-}
primIguales :: Eq a => [a] -> [a]
primIguales [] = []
primIguales [x] = [x]
primIguales (x:y:xs) | x == y = x : primIguales (y:xs)
                     | otherwise = x : []

--(D)--
primIguales' :: Eq a => [a] -> [a] 
primIguales' t = primIgualesA' (t !! 0) t

--------------------------------------------------
------------------ EJERCICIO 10 ------------------
--------------------------------------------------

{-
(A)
Cuenta la cantidad de aparaciones de la subcadena "la" en un String.
-}
contarLa :: String -> Integer
contarLa "" = 0
contarLa [x] = 0
contarLa (x:y:xs) | (x:y:"") == "la" = 1 + contarLa xs
                  | otherwise = contarLa (y:xs)

{-
(B)
Cuenta la cantidad de aparaciones de la subcadena "las" en un String.
-}
contarLas :: String -> Integer
contarLas "" = 0
contarLas [x] = 0
contarLas [x,y]  = 0
contarLas (x:y:z:xs) | (x:y:z:"") == "las" = 1 + contarLas xs
                     | otherwise = contarLas (y:z:xs)


--------------------------------------------------
------------------ EJERCICIO 11 ------------------
--------------------------------------------------

minimo :: (Bounded a, Ord a) => [a] -> a
minimo [] = maxBound
minimo (x:xs) = min x (minimo xs)


-- Variante de minimo con "cuantGen":
minimo' (x:xs) = cuantGen (min) (maxBound) ((x::Int):xs) id


-- Otra variante:
minimo'' :: [Int] -> Int
minimo'' [] = maxBound
minimo'' [x] = x
minimo'' (x:y:xs) = minimo'' ((minimoAux x y):xs)

minimoAux :: Int -> Int -> Int
minimoAux x y = | (x < y) = x
                | otherwise = y

minimo''' (x:xs) = minimum (x:xs)



{-
ALGUNAS DEFINICIONES USADAS EN EL PROYECTO
------------------------------------------

even
-----
even :: Integral a => a -> Bool

-- Descripcion:
"even", es aplicado a Int, devolviendo como resultado, un Booleano que
indica que si el Int en Par (True) o Impar (False).

-- Ejemplos:
even 5 == False
even 2 == True


takeWhile
---------
takeWhile :: (a -> Bool) -> [a] -> [a]Source

-- Descripcion:
"takeWhile", aplica un predicado "P" a una lista "XS", devuelve el prefijo más
largo (posiblemente vacío) de "XS" de los elementos que satisfacen "P".

-- Ejemplos:
takeWhile (< 3) [1,2,3,4,1,2,3,4] == [1,2]
takeWhile (< 9) [1,2,3] == [1,2,3]
takeWhile (< 0) [1,2,3] == []
-}
