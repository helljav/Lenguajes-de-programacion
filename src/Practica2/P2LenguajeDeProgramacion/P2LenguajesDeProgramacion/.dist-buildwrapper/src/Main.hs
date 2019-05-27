--Cosntrutor para definir que los coeficientes
data Fraccion = Coeficientes Int  Int 
                        deriving (Eq)

instance Show Fraccion where
                show(Coeficientes n d) = show(n) ++ "/"++ show (d)


mcd a 0 = a
mcd a b = mcd b (a `mod` b)       


mcm a b = div (a*b) (mcd a b)                                     

--resta(Coeficientes n1 d1) (Coeficientes n2 d2) = Coeficientes ((n1*d2)-(n2*d1)) (d1*d2)


resta (Coeficientes n1 d1) (Coeficientes n2 d2) = Coeficientes (((div (mcm d1 d2) d1)*n1)-((div (mcm d1 d2) d2)*n2)) (mcm d1 d2)

fraccionEgipcia n d = fEgipcia(Coeficientes n d) 

 
fEgipcia (Coeficientes 1 d) = [Coeficientes 1 d]
fEgipcia (Coeficientes n d) 
                            |(n>1) = 
                            (Coeficientes 1 ((div d n)+1)):fEgipcia ( resta (Coeficientes n d) (Coeficientes 1 ((div d n)+1) )) 
                               
                                 

       
                                    
                                                       
