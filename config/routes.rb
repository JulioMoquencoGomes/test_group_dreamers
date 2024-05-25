Rails.application.routes.draw do
  root to: "home#index"
  get "/tourist_spot", to: "tourist_spot#index"
  get "/tourist_spot/result", to: "tourist_spot#result"
end
