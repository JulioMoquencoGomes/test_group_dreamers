Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  root to: "home#index"
  get "/api/tourist_spot", to: "api/tourist_spot#index"
end
