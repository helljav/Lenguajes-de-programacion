module Main where
import Data.Char
main::IO()
main = do menu

--Cosntrutor para definir que los coeficientes
data Fraccion = Coeficientes Int  Int 
                        deriving (Eq)
                        
--Nos ayuda a definir las variables fraccion y fraccionegipcia                       
type FraccEgip = [Fraccion]
type FraccionNormal = Fraccion


--Visualiza una fraccion
instance Show Fraccion where
                show(Coeficientes n d) = show(n) ++ "/"++ show (d)
                
--Lee una fraccion               
instance Read Fraccion where 
                readsPrec _ = readFracc

menu = 
    do
        opcion <- pideOpcion
        hazMenu(read opcion)

hazMenu opcion
           |(opcion ==1)=
                do
                    putStrLn "Ingresa una fraccion de la forma:  N/D"
                    f <- getLine
                    writeFile "FraccionEgipcia.txt" (show (fEgipcia (read f::FraccionNormal)))
                    putStrLn(" ")
                    putStrLn ("LISTO LA FRACCION SE ENCUENTRA EN:  FraccionEgipcia.tx")                
                    menu
                    
                    
            |(opcion ==2)=
                do
                    putStrLn "Dame tu fraccion egipcia"
                    f <- getLine
                    writeFile "Fraccion.txt" (show (read f::FraccEgip))
                    menu
            |(opcion == 2)=
                do
                    writeFile "Fraccion.txt" "[]"
                    menu
                    
            |(opcion == 3)=
                do
                    putStrLn ("Contenido del Archivo FraccionEgipcia.txt")    
                    f<-readFile "FraccionEgipcia.txt"
                    putStr "La fraccion egipcia es:  "
                    putStrLn (show (read f::FraccEgip))
                    menu
                   
            |(opcion == 4) =
                return()
           


                

pideOpcion = 
            do
            putStrLn ("")
            putStrLn ("")
            putStrLn("Hola tus opciones son: ")
            putStrLn ("")
            putStrLn("1) Convertir una fraccion a fraccion egipcia desde el teclado")
            putStrLn("2) Hacer la conversion de la fraccion egipcia desde ek teclado y escribirla en un archivo")
            putStrLn("3) Leer una fraccion egipcia desde archivo")
            putStrLn("4) Salir")
            r <- getLine
            return r
            


        



readFracc :: String -> [(Fraccion, String)]
readFracc str = [(Coeficientes (read n) (read d), resto)]
    where
     n = tomaNum str
     (d,resto) = tomaDen str
     
tomaNum str = takeWhile isDigit str
tomaDen str = (takeWhile isDigit resto, dropWhile isDigit resto)
        where
          resto = tail(dropWhile (/='/') str)



--Metodos para sacar el minimo coun multiplo para reducir las fracciones
mcd a 0 = a
mcd a b = mcd b (a `mod` b) 
mcm a b = div (a*b) (mcd a b)                                     

--Resta de Fracciones(Coeficientes)
resta (Coeficientes n1 d1) (Coeficientes n2 d2) = Coeficientes (((div (mcm d1 d2) d1)*n1)-((div (mcm d1 d2) d2)*n2)) (mcm d1 d2)

--Fraccion Egipcia
--fraccionEgipcia n d = fEgipcia(Coeficientes n d) 
fEgipcia (Coeficientes 1 d) = [Coeficientes 1 d]
fEgipcia (Coeficientes n d) 
                            |(n>1) = 
                            (Coeficientes 1 ((div d n)+1)):fEgipcia ( resta (Coeficientes n d) (Coeficientes 1 ((div d n)+1) )) 

                              

       
                                    
                                                       
