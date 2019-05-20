--Cosntrutor para definir que los coeficientes
data Fraccion = Coeficientes Int Int deriving (Show)

-- Suma y Resta                                   
suma :: Fraccion -> Fraccion -> [Char]
suma ( Coeficientes x1 y1 ) ( Coeficientes x2 y2 ) = if( y1 == 0 || y2 == 0 )
                                                 then error "No se pude dividir entre cero"
                                               else if (x1==0||x2==0)
                                                 then "0"
                                               else
                                                 ("Res = " ++ show (x1*y2 + x2*y1) ++ "/" ++ show (y1*y2) )


                                               
--generaD (Coeficientes num den) = 


resta(Coeficientes a b) (Coeficientes c d) = Coeficientes ((a*d)-(b*c)) (b*d)

 
fEgipcia (Coeficientes n d) = [Coeficientes n d]
fEgipcia (Coeficientes n d) = if n>1
                              then 
                              (Coeficientes 1 ((div d n)+1)):fEgipcia ( resta (Coeficientes n d) (Coeficientes 1 (div d n)+1 )
                                 
                              else
                                [Coeficientes n d]
                                  

       
                                    
                                                       
