Rails.application.routes.draw do
  root to: "crimes#index"

  get "/crimes", to: "crimes#index"
end
