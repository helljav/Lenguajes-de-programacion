class Fracciones
  def initialize(n,d)
    @num = n
    @den = d
  end

  def den
    return @den
  end

  def num
    return @num
  end

  def mcd(a,b)
    if(b==0) then
      return a
    else
      return mcd(b,a%b)
    end
  end

  def mcm(a,b)
    n,d = a*b, mcd(a,b)
    res = n/d
    return res
  end

  def suma(f1,f2)
    dens = (mcm(f1.den,f2.den))
    num = ((dens/f1.den)*f1.num) + ((dens/f2.den)*f2.num)
    return "#{num}/#{dens}"
  end

  def resta(f1,f2)
    dens = (mcm(f1.den,f2.den))
    num = ((dens/f1.den)*f1.num) - ((dens/f2.den)*f2.num)
    return "#{num}/#{dens}"
  end

  def multiplicacion(f1,f2)
    num,den = f1.num*f2.num,f1.den*f2.den
    return "#{num}/#{den}"
  end

  def division(f1,f2)
    num,den = f1.num*f2.den,f1.den*f2.num
    return "#{num}/#{den}"
  end

end#FIN DE LA CLASE FRACCIONES

class FraccionesEgipcias
  
end#FIN DE LA CLASE FRACCIONES EGIPCIAS

f1 = Fracciones.new(1,4)
f2 = Fracciones.new(2,4)

puts "La suma es: #{f1.suma(f1,f2)}"
puts "La resta es: #{f1.resta(f2,f1)}"
puts "La multiplicacion es: #{f1.multiplicacion(f2,f1)}"
puts "La multiplicacion es: #{f1.division(f1,f2)}"
