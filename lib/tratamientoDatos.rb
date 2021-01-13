#Gema para poder leer archivos CSV
require 'csv'

#Las variables dataset1 y dataset2 contienen los respectivos archivos CSV leídos de /data
$dataset1 = File.read("data/dataset1.csv")
$dataset2 = File.read("data/dataset2.csv")

# Clase que trata los datos del CSV
class TratamientoDatos

  #Método que hace el parse de archivo, formato CSV
  def parsecsv(archivo)
    CSV.parse(archivo)
  end
end
