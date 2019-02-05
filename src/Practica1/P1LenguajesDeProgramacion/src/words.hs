word l = split ' ' l



split :: Eq a => a -> [a] -> [[a]]
split d [] = []
split d  texto = x:split d (drop 1 y)
                   where (x,y) = span(/= d) texto
   


