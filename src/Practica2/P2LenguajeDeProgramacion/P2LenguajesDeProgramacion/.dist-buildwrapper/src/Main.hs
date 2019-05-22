--Cosntrutor para definir que los coeficientes
data Fraccion = Coeficientes Int Int 
                        deriving (Eq)

instance Show Fraccion where
                show(Coeficientes n d) = show(n) ++ "/"++ show (d)

                                               


resta(Coeficientes n1 d1) (Coeficientes n2 d2) = Coeficientes ((n1*d2)-(n2*d1)) (d1*d2)

fraccionEgipcia n d = fEgipcia(Coeficientes n d) 

 
fEgipcia (Coeficientes 1 d) = [Coeficientes 1 d]
fEgipcia (Coeficientes n d) 
                            |(n>1) = 
                            (Coeficientes n d):(Coeficientes 1 ((div d n)+1)):fEgipcia ( resta (Coeficientes n d) (Coeficientes 1 ((div d n)+1) )) 
                               
                                 

       
                                    
                                                       
