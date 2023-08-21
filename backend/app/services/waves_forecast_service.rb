class WavesForecastService
  include HTTParty
  base_uri 'http://servicos.cptec.inpe.br' 

  def forecast
    #Niteroi - RJ, Brazil
    response = self.class.get("/XML/cidade/3464/todos/tempos/ondas.xml")
    xml_data = response.body
    items = Hash.from_xml(xml_data)
    grouped_data = Hash.new { |hash, key| hash[key] = [] }
    items['cidade']['previsao'].each do |previsao|
      dia = previsao['dia']
      agitacao = previsao['agitacao']
      altura = previsao['altura']
      direcao = previsao['direcao']
      vento = previsao['vento']
      vento_dir = previsao['vento_dir']
      grouped_data[dia[0..9]] << { time: dia[11..13], power: agitacao, height: altura, direction: direcao, wind: vento, wind_direction: vento_dir }
    end
    grouped_data
  end
end