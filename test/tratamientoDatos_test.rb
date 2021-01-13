#Gema para hacer las pruebas
require 'minitest/autorun'
# Llamamos al archivo peticiones.rb
require_relative '../lib/tratamientoDatos'

# La variable datasetPrueba contiene el read del dataset1.csv para ser tratado
$datasetPrueba = File.read("data/dataset1.csv")

# Prueba de la clase Peticiones
class PeticionesTest < Minitest::Test
  # Prueba del metodo parsecsv, en el cual se hace el parse al csv e ingresamos
  # al primer dato de la tabla y checamos que coincida para asegurar que la
  # lectura fue exitosa
  def test_function1_parsecsv
    assert_equal TratamientoDatos.new.parsecsv($datasetPrueba)[1][0], "TLC"
  end
  # Prueba del metodo parsecsv, en el cual se hace el parse al csv y esto
  # deberia regresarnos un dato tipo Array, por lo que verificamos que asi sea
  def test_function2_parsecsv
    assert_equal TratamientoDatos.new.parsecsv($datasetPrueba).class, Array
  end
end
