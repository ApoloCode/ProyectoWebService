#Llamamos a los archivos peticiones.rb y tratamientoDatos.rb
require './peticiones.rb'
require './tratamientoDatos.rb'

#Clase Main que corre el programa
class Main
  #Instancias de Peticion y TratamientoDatos
  $peticion = Peticion.new
  $td = TratamientoDatos.new

  #Método que corre el programa para el dataset1. Como son puros boletos de adentro del país,
  #se llama ticketsNacionales
  def ticketsNacionales
    #Corre desde 1 al final del array
    for i in 1..$td.parsecsv($dataset1).length-1
      #Se llama a parsecsv() del archivo y se obtienen los datos de la tabla
      origen = $td.parsecsv($dataset1)[i][0]
      destino = $td.parsecsv($dataset1)[i][1]
      deslat = $td.parsecsv($dataset1)[i][4].to_f
      deslon = $td.parsecsv($dataset1)[i][5].to_f
      #Se imprime el origen y destino del boleto
      puts "Origen: " + origen
      puts "Destino: " + destino
      #Se llama a petición()
      puts $peticion.peticionCiudad(destino, deslat, deslon)
    end
  end

  #Método que corre el programa para el dataset2. Como son  boletos con destinos a todo el
  #mundo, se llama ticketsInternacionales
  def ticketsInternacionales
    for i in 1..$td.parsecsv($dataset2).length-1
      destinoInternacional = $td.parsecsv($dataset2)[i][0]
      puts "Destino: " + destinoInternacional
      puts $peticion.peticionPais(destinoInternacional)
    end
  end
end

#Se intancia Main
main = Main.new

#Se dividen los datos de clima en nacionales e internacionales, corriendo sus respectivos métodos
puts "Viajes Nacionales:"
puts main.ticketsNacionales
puts "Viajes Internacionales"
puts main.ticketsInternacionales
