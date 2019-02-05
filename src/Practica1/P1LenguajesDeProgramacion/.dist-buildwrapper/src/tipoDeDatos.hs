data Fraccion = Coeficientes Int Int deriving (Show)

-- Suma y Resta                                   
suma :: Fraccion -> Fraccion -> [Char]
suma ( Coeficientes x1 y1 ) ( Coeficientes x2 y2 ) = if( y1 == 0 || y2 == 0 )
                                                 then error "No se pude dividir entre cero"
                                               else if (x1==0||x2==0)
                                                 then "0"
                                               else
                                                 ("Res = " ++ show (x1*y2 + x2*y1) ++ "/" ++ show (y1*y2) )
                            

-- Multiplicacion
multiplicacion :: Fraccion -> Fraccion -> [Char]
multiplicacion ( Coeficientes x1 y1 ) ( Coeficientes x2 d ) = if( y1 == 0 || d == 0 )
                                                    then error "No es un numero"
                                                 else if ( x1 == 0 || x2 == 0)
                                                    then "0"
                                                 else
                                                    ("Resultado = " ++ show (x1*x2) ++ "/" ++ show (y1*d) )

-- Division
divCoeficientes :: Fraccion -> Fraccion -> [Char]
divCoeficientes ( Coeficientes x1 y1 ) ( Coeficientes x2 y2 ) = if( y1 == 0 || y2 == 0 )
                                                   then error "No es un numero"
                                                else if ( x1 == 0 || x2 == 0)
                                                   then "0"
                                                else
                                        ("Res = " ++ show (x1*y2) ++ "/" ++ show (y1*x2) )