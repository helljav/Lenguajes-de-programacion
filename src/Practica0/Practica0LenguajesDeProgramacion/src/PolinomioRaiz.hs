rC:: Double -> Double
rC x = sqrt x

raiz :: Double -> Double -> Double -> [Double]
raiz a b c = [ (-b+rC(b*b-4*a*c))/(2*a),
                   (-b-rC(b*b-4*a*c))/(2*a) ]
