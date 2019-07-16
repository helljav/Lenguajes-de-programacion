require 'fox16'
require 'TestProlog'

include Fox

class GUI < FXMainWindow
  def initialize(app)
    super(app,"Applicación Sencilla", :width => 400, :height => 200)

    ###########################################
    ######### Config Menu #####################
    ###########################################

    # Menu del archivo
    barra = FXMenuBar.new(self, :opts => LAYOUT_SIDE_TOP|LAYOUT_FILL_X)
    menuArch = FXMenuPane.new(self)
    FXMenuTitle.new(barra, "&Archivo", nil, menuArch)

    menuAbre = FXMenuCommand.new(menuArch, "&Abrir..")
    
    # Menu guarda
    menuGuarda = FXMenuCommand.new(menuArch, "&Guardar")
    
    #Menu salir
    menuSalir = FXMenuCommand.new(menuArch, "&Salir", nil, getApp(), FXApp::ID_QUIT)
    
    
    
    
    m = FXMatrix.new(self,2,:opts => MATRIX_BY_COLUMNS)
    FXLabel.new(m,"Nombre:")
    @nombre = FXDataTarget.new("Pedro")
    FXTextField.new(m,25,:target => @nombre, :selector => FXDataTarget::ID_VALUE)

    FXLabel.new(m,"Ocupación:")
    @ocupacion = FXDataTarget.new("Profesor")
    FXTextField.new(m,25,:target => @ocupacion, :selector => FXDataTarget::ID_VALUE)
    @ocupacion.connect(SEL_COMMAND) do
      puts "#{@ocupacion.value}"
    end

    #######################################
    ######### EVENTOS #####################
    #######################################

    menuAbre.connect(SEL_COMMAND) do
      dialog = FXFileDialog.new(self, "Abre archivo prolog..")
      dialog.selectMode = SELECTFILE_EXISTING
      dialog.patternList = ["Archivos Prolog (*.pl)", "Todos (*)"]
      if dialog.execute != 0 then
        rutaList = dialog.filename.to_s().split("\\")
        rlPos = rutaList.length - 1
        p = Prolog.new(rutaList[rlPos])
        r = p.haz("member(X,[1,2,3])")
        until (r == nil)
          puts r
          r = p.next
        end
        p.fin
        puts "Se termino"
      end
    end
    
    menuGuarda.connect(SEL_COMMAND) do
      archivo = FXFileDialog::getSaveFilename(self,"guardar","nuevo.pl","Prolog (*.pl) \nTodos(*)")
      if archivo != "" then
        puts "\n Guarda el archivo #{archivo}"
      end
    end
    
    
    @nombre.connect(SEL_COMMAND) do
      puts "#{@nombre.value}"
    end

  end

  def create
    super
    show(PLACEMENT_SCREEN)
  end

end

if __FILE__ == $0 then
  app = FXApp.new("AppSen")
  ven = GUI.new(app)
  app.create
  app.run
end