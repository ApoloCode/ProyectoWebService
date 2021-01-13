#Gema para hacer las peticiones al API de OpenWeatherMap
require 'open-weather-ruby-client'
#Gema para tratar archivos .json
require "json"

#Variable tipo Hash para guardar las peticiones hechas
$cache = {}

#Variables tipo string con los datos de clima requeridos
$estadoTratado = ""
$sensaTem = ""
$hume = ""
$presion = ""
$temp = ""
$tempMin = ""
$tempMax = ""
$name = ""

#Cliente de OpenWeather con la llave de usuario, para poder hacer las peticiones
$client = OpenWeather::Client.new(
  api_key: "48d1feecc0a3f91c2b39d292182208b6"
)

#Clase que se encarga de llamar al web service y hacer las peticiones
class Peticion

  #Método que, dado un nombre de ciudad y coordenadas de latitud y longitud, hace la petición al
  #web service, e imprime las líneas de datos de clima de ese lugar en salida estándar
  def peticionCiudad(city, lat, lon)

    #Revisar el caché para no hacer llamadas repetidas.
    if $cache[city] == nil then
      #El begin atrapa la excepción que saca el hacer la llamada, cuando el nombre de ciudad o
      #coordenadas no son correctos
      begin
        #Llamada al web service (método de la Gema)
        data = $client.current_geo(lat, lon, lang: 'es')
        #Si es que data existe, se sacan y da formato a los datos de clima
        if data
          estado = (data.weather.to_json).split(/,/)[2].split(/:/)[1]
          $estadoTratado = estado.slice(1..(estado.chars.length - 2)).capitalize
          $sensaTem = (data.main.feels_like_c).to_s
          $hume = (data.main.humidity).to_s
          $presion = (data.main.pressure).to_s
          $temp = (data.main.temp_c).to_s
          $tempMin = (data.main.temp_min_c).to_s
          $tempMax = (data.main.temp_max_c).to_s

          #Se guarda la información nueva en el hash, con la ciudad como llave
          $cache[city] = [$estadoTratado,$sensaTem,$hume,$presion,$temp,$tempMin,$tempMax]

          #Imprimir los datos
          puts 'Sensación de Temperatura: '+ $sensaTem + "°C"
          puts 'Humedad: ' + $hume
          puts 'Estado del Clima: ' + $estadoTratado
          puts 'Presion Atmosferica: ' + $presion
          puts 'Temperatura: ' + $temp + "°C"
          puts 'Temperatura Mínima: ' + $tempMin + "°C"
          puts 'Temperatura Máxima: ' + $tempMax + "°C"
        end
      #Si la llamada no fue exitosa, se imprime el mensaje de error
      rescue
        puts "La ciudad no existe o esta mal escrito"
      end
    #En caso de existir los datos en el caché, se saca directamente de ahí.
    else
      puts 'Sensación de Temperatura: '+ $sensaTem + "°C"
      puts 'Humedad: ' + $hume
      puts 'Estado del Clima: ' + $estadoTratado
      puts 'Presion Atmosferica: ' + $presion
      puts 'Temperatura: ' + $temp + "°C"
      puts 'Temperatura Mínima: ' + $tempMin + "°C"
      puts 'Temperatura Máxima: ' + $tempMax + "°C"
    end
  end

  #Sobreescritura del método anterior, donde solo se usa el nombre del lugar
  def peticionPais(pais)
    if $cache[pais] == nil then
      begin
        data = $client.current_weather(city: pais, lang: 'es')
        if data
          estado = (data.weather.to_json).split(/,/)[2].split(/:/)[1]
          $estadoTratado = estado.slice(1..(estado.chars.length - 2)).capitalize
          $sensaTem = (data.main.feels_like_c).to_s
          $hume = (data.main.humidity).to_s
          $presion = (data.main.pressure).to_s
          $temp = (data.main.temp_c).to_s
          $tempMin = (data.main.temp_min_c).to_s
          $tempMax = (data.main.temp_max_c).to_s
          $cache[pais] = [$estadoTratado,$sensaTem,$hume,$presion,$temp,$tempMin,$tempMax]

          puts 'Sensación de Temperatura: '+ $sensaTem + "°C"
          puts 'Humedad: ' + $hume
          puts 'Estado del Clima: ' + $estadoTratado
          puts 'Presion Atmosferica: ' + $presion
          puts 'Temperatura: ' + $temp + "°C"
          puts 'Temperatura Mínima: ' + $tempMin + "°C"
          puts 'Temperatura Máxima: ' + $tempMax + "°C"
        end
      rescue
        puts "La ciudad no existe o no esta escrito el nombre completo"
      end
    else
      puts 'Sensación de Temperatura: '+ $sensaTem + "°C"
      puts 'Humedad: ' + $hume
      puts 'Estado del Clima: ' + $estadoTratado
      puts 'Presion Atmosferica: ' + $presion
      puts 'Temperatura: ' + $temp + "°C"
      puts 'Temperatura Mínima: ' + $tempMin + "°C"
      puts 'Temperatura Máxima: ' + $tempMax + "°C"
    end
  end
end
