module Main ( main ) where

import Data.Char (isSpace)
import Control.Applicative ( (<$>) )

import Dict

data Action = CreateEmpty | Add Word Def | Delete Word | Search Word | Size
            | Show | Save FilePath | Load FilePath | Quit

main :: IO ()
main = do clearScreen
          cycleMain dict_empty

cycleMain :: Dict -> IO ()
cycleMain d = do
  (a,d') <- stepMain d
  case a of
    Quit -> return ()
    _    -> cycleMain d'

stepMain :: Dict -> IO (Action,Dict)
stepMain dict = do
    a <- getActionMenu
    case a of
      Quit        -> return (a, dict)
      CreateEmpty -> return (a, dict_empty)
      Add w df    -> return (a, dict_add w df dict)
      Delete w    -> return (a, dict_del w dict)
      Search w    -> do showSearch w (dict_search w dict) 
                        return (a, dict)
      Size        -> do showSize dict
                        return (a,dict)
      Show        -> do showDefs dict
                        return (a,dict)
      Load f      -> do dict' <- dictLoad f
                        showSize dict'
                        return (a,dict')
      Save f      -> do dictSave dict f
                        return (a,dict)
    where
       showSize dict = putStrLn $ "Hay " ++ show (dict_length dict)
                         ++ " palabras en el diccionario."

       showDefs dict = mapM_ showDef (dict_toDefs dict)
       showDef (w,d) = putStrLn $ w ++ " : " ++ d

       showSearch w Nothing  = putStrLn "La palabra no existe."
       showSearch w (Just d) = putStrLn $ w ++ " : " ++ d

getActionMenu :: IO Action
getActionMenu = do
    printMenu
    putStrLn "Ingrese una opcion y despues [Intro] "
    line <- getLineTrim
    clearScreen
    case line of
      "q" -> return Quit
      "v" -> return CreateEmpty
      "t" -> return Size
      "s" -> return Show
      "a" -> do w <- getWord
                d <- getDef
                return (Add w d)
      "d" -> do w <- getWord
                return (Delete w)
      "b" -> do w <- getWord
                return (Search w)
      "c" -> do f <- getNameFile
                return (Load f)
      "g" -> do f <- getNameFile
                return (Save f)
      _   -> getActionMenu
    where
      getWord = do
        putStrLn "Ingrese la palabra: "
        getLineTrim
      getDef = do
        putStrLn "Ingrese la definicion: "
        getLineTrim
      getNameFile = do
        putStrLn "Ingrese el nombre de archivo: "
        str <- getLineTrim
        return (str++".dic")

printMenu :: IO ()
printMenu = putStrLn $ unlines
              ["***************************************",
               "* v: Vaciar diccionario               *",
               "* a: Agregar definicion               *",
               "* d: Borrar definicion                *",
               "* b: Buscar definicion                *",
               "* t: Ver el taman~o del diccionario   *",
               "* s: Mostrar diccionario              *",
               "* c: Cargar diccionario desde archivo *",
               "* g: Grabar diccionario a un archivo  *",
               "* q: Salir                            *",
               "***************************************"]

dictLoad :: FilePath -> IO Dict
dictLoad fp = do
    str <- readFile fp
    return $ toDict str
    where
      toDict  strs = foldr (uncurry dict_add) dict_empty $ map toPairs $ lines strs

      toPairs str = case span (/=':') str of
                        ("",_)     -> error "Palabra vacia"
                        (w,":")    -> error $ "Definicion vacia en palabra " ++ w
                        (w,"")     -> error $ "Definicion vacia en palabra " ++ w
                        (w, ':':d) -> (trim w, trim d)
 
dictSave :: Dict -> FilePath -> IO ()
dictSave d fp = writeFile fp $ defsToString $ dict_toDefs d
    where
      defsToString defs = unlines [ w ++ ":" ++ d | (w,d) <- defs ]

-- | Quita espacios al principio y al final de una String.
trim :: String -> String
trim = f . f
   where f = reverse . dropWhile isSpace

getLineTrim :: IO String
getLineTrim = trim <$> getLine

clearScreen :: IO ()
clearScreen = sequence_ (replicate 80 (putChar '\n'))
