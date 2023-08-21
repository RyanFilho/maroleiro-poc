Rails.application.routes.draw do
  get "/api/wavesforecast", to: "waves_forecast#forecast"
end
