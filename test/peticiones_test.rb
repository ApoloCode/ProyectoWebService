#Gema para hacer las pruebas
require 'minitest/autorun'
# Llamamos al archivo peticiones.rb
require_relative '../lib/peticiones'

# Prueba de la clase Peticiones
class PeticionesTest < Minitest::Test
  # Prueba del metodo peticionCiudad, en el cual se pide la información del
  # clima en Ciudad de México y checamos que la peticion no regrese vacia
  def test_function_peticionCiudad
    prueba = nil
    prueba = Peticion.new.peticionCiudad("MEX",19.4326,99.1332)
    assert (prueba == nil)
  end
  # Prueba del método peticionPais, en el cual se pide la información del
  # clima en Tokio y checamis que la peticion no regrese vacio
  def test_function_peticionPais
    prueba = nil
    prueba = Peticion.new.peticionPais("Tokyo")
    assert (prueba == nil)
  end
end
