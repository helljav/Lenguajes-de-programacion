
mergeSort :: (Ord a) => [a] -> [a]
mergeSort [] = []
mergeSort [elemento] = [elemento]
mergeSort lista = merge (mergeSort listaIzq) (mergeSort listaDer)
                    where listaIzq = take ((length lista) `div` 2) lista
                          listaDer = drop ((length lista) `div` 2) lista
          
-- mezcla las listas
merge :: (Ord a) => [a] -> [a] -> [a]
merge listaIzq [] = listaIzq
merge [] listaDer = listaDer
merge (x:xs) (y:ys)
  | x < y     = x:(merge xs (y:ys))
| otherwise = y:(merge (x:xs) ys) 