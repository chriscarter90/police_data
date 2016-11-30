Rails.application.routes.draw do
  get '/crimes', to: 'crimes#index'
end
