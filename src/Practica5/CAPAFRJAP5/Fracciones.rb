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

  def self.mcd(a,b)
    if(b==0) then
      return a
    else
      return mcd(b,a%b)
    end
  end

  def self.mcm(a,b)
    n,d = a*b, mcd(a,b)
    res = n/d
    return res
  end

  def self.suma(f1,f2)
    dens = (mcm(f1.den,f2.den))
    num = ((dens/f1.den)*f1.num) + ((dens/f2.den)*f2.num)
    faux = Fracciones.new(num,dens)
    return faux
  end

  def self.resta(f1,f2)
    dens = (mcm(f1.den,f2.den))
    num = ((dens/f1.den)*f1.num) - ((dens/f2.den)*f2.num)
    faux = Fracciones.new(num,dens)
    return faux
  end

  def self.multiplicacion(f1,f2)
    num,den = f1.num*f2.num,f1.den*f2.den
    faux = Fracciones.new(num,den)
    return faux
  end

  def self.division(f1,f2)
    num,den = f1.num*f2.den,f1.den*f2.num
    faux = Fracciones.new(num,den)
    return faux
  end

end#FIN DE LA CLASE FRACCIONES

class FraccionesEgipcias
  
end#FIN DE LA CLASE FRACCIONES EGIPCIAS
##
#f1 = Fracciones.new(32,27)
#f2 = Fracciones.new(1,1)
#div = (32/27)+1
##
#f = Fracciones.suma(f1,f2)
#puts "#{div}/#{f.den}"

