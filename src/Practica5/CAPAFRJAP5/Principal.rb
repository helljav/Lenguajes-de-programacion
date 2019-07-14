require 'FraccionesEgipcias'

class Principal
  puts("\n\t***************Clase Fracciones Operaciones basicas **************** \n")
  print("Ingrese el numerador de la primera fraccion (f1): ")
  n1 = gets.to_i
  print("Ingrese el denominador de la primera fraccion (f1): ")
  d1 = gets.to_i

  print("\nIngrese el numerador de la Segunda fraccion (f2): ")
  n2 = gets.to_i
  print("Ingrese el denominador de la Segunda fraccion (f2): ")
  d2 = gets.to_i

  f1 = Fracciones.new(n1,d1)
  f2 = Fracciones.new(n2,d2)
  
  s = Fracciones.suma(f1,f2)
  r = Fracciones.resta(f1,f2)
  m = Fracciones.multiplicacion(f1,f2)
  d = Fracciones.division(f1,f2)

  puts("\nLa Suma de f1 + f2 es: ")
  print(" #{s.num}/#{s.den}")

  puts("\nLa resta de f1 - f2 es: ")
  print(" #{r.num}/#{r.den}")
  
  puts("\nLa multiplicacion de f1 * f2 es: ")
  print(" #{m.num}/#{m.den}")
  
  puts("\nLa division de f1 / f2 es: ")
  print(" #{d.num}/#{d.den}")
  
  puts("\n\t*************** Clase Fracciones Egipcias  ****************** \n")
  puts("CONVERSION DE FRACCION A FRACCION EGIPCIA\n")
  
  print "Dame el numerador de la fraccion: "
  n = gets.to_i
  print "Dame el denominador de la fracion: "
  d = gets.to_i
  print "\n"
  
  f = Fracciones.new(n,d)
  lista = []
  lista.push(f)
  lista = FraccionesEgipcias.convierteEgipcia(f,lista)
  
  print"[#{lista[0].num}/#{lista[0].den} = "
  for i in 1..(lista.length)-1    
    print "#{lista[i].num}/#{lista[i].den} + "
  end
  print"]"
end