require 'Fracciones'
class FraccionesEgipcias
  
  
  def initialize(n,d)
    @f = Fraccion.new(n,d)
  end
  
  def f
    return @f
  end 
  
     
  def self.convierteEgipcia(f,listaFraccion)
    if (f.den==0) then
      puts "Ingrese una fraccion valida"
    else
      if(f.num==1) then
       return listaFraccion.push(f)        
      end
      
      den = (f.den/f.num)+1
      faux = Fracciones.new(1,den)
      listaFraccion.push(faux)
      faux = Fracciones.resta(f,faux)
      convierteEgipcia(faux,listaFraccion)    
      
    end
    
  end  
end




