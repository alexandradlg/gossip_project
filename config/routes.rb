Rails.application.routes.draw do
  get 'gossips/new'
  root 'static_pages#home'
  resources :gossips do
    resources :comments
  end
end
