class WavesForecastController < ApplicationController
  def forecast
    service = WavesForecastService.new
    json_data = service.forecast
    render json: json_data
  end
end
