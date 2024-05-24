Rails.application.routes.draw do
  root to: "home#index"
  get "/tourist_spot", to: "tourist_spot#index"
end
