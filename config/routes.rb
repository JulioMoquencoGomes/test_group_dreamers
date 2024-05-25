Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  root to: "home#index"
  get "/tourist_spot", to: "tourist_spot#index"
  get "/tourist_spot/result", to: "tourist_spot#result"
end
