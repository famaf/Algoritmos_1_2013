{-# LANGUAGE NPlusKPatterns #-}

-------------------------------------------------
------------------ EJERCICIO 1 ------------------
-------------------------------------------------

-- (A) --
-- Calcula el factorial de un numero natural.
fac :: Integral a => a -> a
fac 0 = 1
fac (n + 1)  = (n + 1) * fac n


-- Calcula la suma de todos los elementos de una lista de enteros.
sum' :: Num a => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs

-- Dado un natural, devuelve un numero de la sucesion de fibonacci,
-- que se encuentra en la posicion ingresada al principio.
fib :: (Integral a, Num a) => a -> a
fib 0 = 0
fib 1 = 1
fib (n + 2) = fib n + fib (n + 1)


-- (B) --
-- Funcion Cuantificador universal.
cuantGen :: (b -> b -> b) -> b -> [a] -> (a -> b) -> b
cuantGen op z [] t = z
cuantGen op z (x:xs) t = (t x) `op` (cuantGen op z xs t)


-- Propiedad de la funcion fac.
prop_fac :: Int -> Bool
prop_fac n = fac n == (cuantGen (+) 0 [0..(n-1)] (\x -> x * fac x)) + 1


-- Propiedad de la funcion sum'.
prop_sum :: [Int] -> Bool
prop_sum xs = sum' xs == (cuantGen (+) 0 [0..(length xs) - 1] (\x -> xs !! x ))


-- Propiedad de la funcion fib.
prop_fib :: Int -> Bool
prop_fib n = fib n < (2^n)


-------------------------------------------------
------------------ EJERCICIO 2 ------------------
-------------------------------------------------


-- (A) --
-- Dado un numero y un natural, calcula el primer numero ingresado elevado
-- (potencia) al segundo numero ingresado.
exp' :: Int -> Int -> Int
exp' x 0 = 1
exp' x (n+1) = x * (exp' x n)

-- (B) --
-- Dada un lista de numeros, calcula la suma de todos sus elementos elevados
-- al cuadrado (^2).
sum_cuad :: [Int] -> Int
sum_cuad [] = 0
sum_cuad (x:xs) = (x^2) + sum_cuad xs

-- (C) --
-- Dado un predicado y una lista de elementos, devuelve la cantidad de
-- elementos (que estan en la lista) que cumplen con el predicado.
cuantos :: (a -> Bool) -> [a] -> Int
cuantos p [] = 0
cuantos p (x:xs) | p x = 1 + cuantos p xs
                 | otherwise = cuantos p xs

-- (D) --
-- Dado un numero y una lista de numeros, indica la menor posicion en la que se
-- encuentra ese numero dado.
busca :: (Bounded a, Eq a1, Num a) => a1 -> [a1] -> a
busca e [] = maxBound
busca e (x:xs) | x == e = 0
               | otherwise = (busca e xs) + 1

-- USAR AL FINAL DE LA LISTA " ::Int "

-------------------------------------------------
------------------ EJERCICIO 3 ------------------
-------------------------------------------------

data Titulo = Ducado
            | Marquesado
            | Condado
            | Vizcondado
            | Baronia
            deriving (Eq)

-- (A) --
-- Dado un constructor del TIPO: Titulo, devuelve la forma masculina del titulo.
hombre :: Titulo -> String
hombre x | x == Ducado = "Duque"
         | x == Marquesado = "Marques"
         | x == Condado = "Conde"
         | x == Vizcondado = "Vizconde"
         | x == Baronia = "Baron"

-- (B) --
-- Dado un constructor del TIPO: Titulo, devuelve la forma femenina del titulo.
dama :: Titulo -> String
dama x | x == Ducado = "Duquesa"
       | x == Marquesado = "Marquesa"
       | x == Condado = "Condesa"
       | x == Vizcondado = "Vizcondesa"
       | x == Baronia = "Baronesa"


-------------------------------------------------
------------------ EJERCICIO 4 ------------------
-------------------------------------------------

type Territorio = String
type Nombre = String

data Persona = Rey
             | Noble Titulo Territorio
             | Caballero Nombre
             | Aldeano Nombre
             deriving (Eq)


-- (B) --
-- Dada una Persona devuelve la forma en que se lo menciona en la corte.
tratamiento :: Persona -> String
tratamiento Rey = "Su majestad el Rey"
tratamiento (Noble titulo territorio) = "El " ++ hombre titulo ++ " de " ++ territorio
tratamiento (Caballero nombre) = "Sir " ++ nombre
tratamiento (Aldeano nombre) = nombre

-- (C) --
-- Definimos un tipo nuevo de dados llamado Genero, y le agregamos un argumento
-- mas a los constructores: Noble y Caballero.
data Genero = Hombre
            | Mujer
            deriving (Eq)

data Persona' = Rey' Genero
              | Noble' Genero Titulo Territorio
              | Caballero' Genero Nombre
              | Aldeano' Nombre
              deriving (Eq)


-- Dado un constructor del TIPO: Genero, devuelve el articulo de ese mismo
-- contructor.
articulo :: Genero -> String
articulo Hombre = "El "
articulo Mujer = "La "


articulo' :: Genero -> String
articulo' Hombre = "el "
articulo' Mujer = "la "


reyes :: Genero -> String
reyes Hombre = "Rey"
reyes Mujer = "Reina"


-- Dada una Persona devuelve la forma en que se lo menciona en la corte.
tratamiento' :: Persona' -> String
tratamiento' (Rey' genero) = "Su majestad " ++ articulo' genero ++ reyes genero
tratamiento' (Noble' genero titulo territorio) | genero == Mujer = articulo genero ++ dama titulo ++ " de " ++ territorio
                                               | genero == Hombre = articulo genero ++ hombre titulo ++ " de " ++ territorio
tratamiento' (Caballero' genero nombre) | genero == Mujer = "Lady " ++ nombre
                                        | genero == Hombre = "Sir " ++ nombre
tratamiento' (Aldeano' nombre) = nombre


-- (D)
-- Dada un lista de personas devuelve los nombres de los caballeros unicamente.
sirs :: [Persona] -> [String]
sirs [] = []
sirs ((Caballero x):xs) = x : sirs xs
sirs (_:xs) = sirs xs


-- (E) (Punto *)
-- Funcion sirs, pero programada con funciones del preludio de Haskell.
sirs' :: [Persona] -> [String]
sirs' [] = []
sirs' personas = map (solonombre) (filter (caballeros) personas)


-- Dada una persona devuelve True, si esta es un Caballero.
caballeros :: Persona -> Bool
caballeros (Caballero nombre) = True
caballeros _ = False


-- Dada una persona (esencialmente un caballero) devuelve solamente su nombre.
solonombre :: Persona -> String
solonombre (Caballero nombre) = nombre


-------------------------------------------------
------------------ EJERCICIO 5 ------------------
-------------------------------------------------

type Base = Float
type Altura = Float
type Largo = Float
type Diametro = Float


data Figura = Triangulo Base Altura 
            | Rectangulo Base Altura
            | Linea Largo
            | Circulo Diametro


-- Dada una figura, devuelve el valor de su area.
area :: Figura -> Float
area (Triangulo base altura) = (base * altura) / 2
area (Rectangulo base altura) = (base * altura)
area (Circulo diametro) = (pi * (diametro^2)) / 4


-------------------------------------------------
------------------ EJERCICIO 6 ------------------
-------------------------------------------------

data ListAssoc a b = Empty | Node a b (ListAssoc a b)

-- (A)
-- Instanciacion del tipo ListAssoc para representar la informacion almacenada
-- en una guia telefonica.
type Guia_Telefonica = ListAssoc String Int


-- (B)
-- Dada una Lisra de Asociaciones devuelve la cantidad de datos en la lista.
la_long :: Integral c => ListAssoc a b -> c
la_long Empty = 0
la_long (Node a b l) = 1 + la_long l


-- (C)
-- Dada una Lista de Asociaciones devuelve la lista de pares contenida en la
-- lista de asociaciones.
la_aListaDePares :: ListAssoc a b -> [(a,b)]
la_aListaDePares Empty = []
la_aListaDePares (Node a b l) = [(a,b)] ++ la_aListaDePares l


-- (D)
-- Dada una Lista de Asociaciones y una clave devuelve el dato asociado si es
-- que existe.
la_buscar :: Eq a => ListAssoc a b -> a -> Maybe b
la_buscar Empty x = Nothing
la_buscar (Node a b l) x | x == a = Just b
                         | otherwise = la_buscar l x


-- (E)
--Ejercicio 8 del Proyecto 1 (encuentra)


-------------------------------------------------
------------------ EJERCICIO 7 ------------------
-------------------------------------------------

-- (A)
-- Calcula el minimo elemento de una lista NO VACIA de enteros.
minimo :: [Int] -> Int
minimo [x] = x
minimo (x:xs) = x `min` minimo xs


-- Determina si los elementos de una lista de enteros estan ordenados en forma
-- creciente.
creciente :: [Int] -> Bool
creciente [] = True
creciente [x] = True
creciente (x:y:xs) = (x < y) && creciente (y:xs)


-- Determina si los elementos de una lista de tipo A son todos iguales entre si.
iguales :: Eq a => [a] -> Bool
iguales [] = True
iguales [x] = True
iguales (x:y:xs) = (x==y) && iguales (y:xs)

-- (B)
-- Computa la aproximacion del numero "pi", segun tan grande sea el "n"
-- (mientras mas grande mas se aproxima a "pi").
pi' :: Fractional a => Integer -> a
pi' n = 4 * (pi'' n)


pi'' :: Fractional a => Integer -> a
pi'' n = fst (h n)


h :: Fractional a => Integer -> (a, a)
h 0 = (0, 1)
h (n+1) = (a + (b/( 2*(fromInteger n) + 1)), -b)
        where
        (a, b) = h n


-- (C)
-- Dada una lista de enteros, devuelve True si la suma de los elementos de cada
-- sublista son >= 0 (todos), caso contrario devuelve False.
-- VER EJEMPLO EN CUADERNO...
psum :: [Int] -> Bool
psum xs = psum2 0 xs


psum2 :: Int -> [Int] -> Bool
psum2 n [] = n >= 0
psum2 n (x:xs) = (n>=0) && psum2 (n+x) xs


-- Dada una lista de enteros, devuelve True si por lo menos una de las sumas
-- de las sublistas es igual a un elemento en una posicion de la lista.
-- VER EJEMPLO EN CUADERNO...
sum_ant :: (Eq a, Num a) => [a] -> Bool
sum_ant xs = sum_ant2 0 xs


sum_ant2 :: (Eq a, Num a) => a -> [a] -> Bool
sum_ant2 n [] = False
sum_ant2 n (x:xs) = (x==n) || sum_ant2 (n+x) xs


-- (D)
-- Dado un natural determina si es el cuadrado de un numero.
cuad :: (Integral a) => a -> Bool
cuad n = cuad' n 0

cuad' :: (Integral a) => a -> a -> Bool
cuad' 0 m = (m==0)
cuad' (n+1) m = cuad' n (m+1) || (n^2 + n == m)


-- Cuenta la cantidad de segmentos iniciales de una lista
-- cuya suma es igual a 8.
n8 :: (Eq a1, Num a, Num a1) => [a1] -> a
n8 xs = n8' 0 xs


n8' :: (Eq a1, Num a1, Num a) => a1 -> [a1] -> a
n8' n [] | n == 8 = 1
         | otherwise = 0
n8' n (x:xs) | n == 8 = 1 + n8' (n+x) xs
             | otherwise = n8' (n+x) xs


-------------------------------------------------
------------------ EJERCICIO 8 ------------------
-------------------------------------------------

data Arbol a = Hoja | Rama (Arbol a) a (Arbol a) deriving Show

-- (A)
-- Dado un arbol devuelve la cantidad de datos almacenados.
aLargo :: Integral b => Arbol a -> b
aLargo Hoja = 0
aLargo (Rama rama1 nodo rama2) = 1 + aLargo rama1 + aLargo rama2


-- (B)
-- Dado un arbol devuelve la cantidad de hojas.
aCantHojas :: Integral b => Arbol a -> b
aCantHojas Hoja = 1
aCantHojas (Rama rama1 nodo rama2) = aCantHojas rama1 + aCantHojas rama2


-- (C)
-- Dado un arbol que contiene numeros, los incrementa en uno.
aInc :: Num a => Arbol a -> Arbol a
aInc Hoja = Hoja
aInc (Rama rama1 nodo rama2) = (Rama (aInc rama1) (nodo + 1) (aInc rama2))


-- (D)
-- Dado un arbol de personas, devuelve el mismo arbol con las personas
-- representadas en la forma en que se las menciona en la corte
-- (se usa la funcion tratamiento).
aTratamiento :: Arbol Persona -> Arbol String
aTratamiento Hoja = Hoja
aTratamiento (Rama rama1 nodo rama2) = (Rama (aTratamiento rama1) (tratamiento nodo) (aTratamiento rama2))


-- (E)
-- Dada una funcion y un arbol, aplica la funcion a todos los elementos
-- del arbol.
aMap :: (a -> b) -> Arbol a -> Arbol b
aMap funcion Hoja = Hoja
aMap funcion (Rama rama1 nodo rama2) = (Rama (aMap funcion rama1) (funcion nodo) (aMap funcion rama2))


-- (F)
-- Funciones "aInc y aTratamiento" usando la funcion aMap. 
aInc' :: Num a => Arbol a -> Arbol a
aInc' arbol = aMap (+1) arbol


aTratamiento' :: Arbol Persona -> Arbol String
aTratamiento' arbol = aMap (tratamiento) arbol


-- (G)
-- Suma los elementos de un arbol.
aSum :: Num a => Arbol a -> a
aSum Hoja = 0
aSum (Rama rama1 nodo rama2) = nodo + (aSum rama1) + (aSum rama2)


-- (H)
-- Multiplica los elementos de un arbol.
aProd :: Num a => Arbol a -> a
aProd Hoja = 1
aProd (Rama rama1 nodo rama2) = nodo * (aProd rama1) * (aProd rama2)


-------------------------------------------------
------------------ EJERCICIO 9 ------------------
-------------------------------------------------

-- Funcion Cuantificador Sumatoria.
sumatoria' :: Num a => [t] -> (t -> a) -> a
sumatoria' [] t = 0
sumatoria' (x:xs) t = t x + sumatoria' xs t


-- Funcion que calcula el la aproximacion del nuemro pi, con la formula
-- propuesta por Bailey.
bailey_pi :: (Fractional a) => Integer -> a
bailey_pi x = sumatoria' [0..(x-1)] pi_nuevo


pi_nuevo :: (Fractional a) => Integer -> a
pi_nuevo x = (g1 x) * ((g2 x) - (g3 x) - (g4 x) - (g5 x))


g1 :: (Fractional a) => Integer -> a
g1 x = (1/(16^(fromInteger x)))


g2 :: (Fractional a) => Integer -> a
g2 x = (4/(8*(fromInteger x)+1))


g3 :: (Fractional a) => Integer -> a
g3 x = (2/(8*(fromInteger x)+4))


g4 :: (Fractional a) => Integer -> a
g4 x = (1/(8*(fromInteger x)+5))


g5 :: (Fractional a) => Integer -> a
g5 x = (1/(8*(fromInteger x)+6))

{-
Comparando esta implementacion del calculo de aproximacion del numero PI hecha
por Bailey, con la que hicimos en teorico, se puede notar la gran presicion del
nombrado primero, ya que al poner un numero bastante chico se aproxima de una
manera impresionante al numero pi, mientras que el echo por nosotros no tiene
la misma presicion
-}
