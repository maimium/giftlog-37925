Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    root :to => "devise/sessions#new"
  end

  resources :received_gifts
  resources :gave_gifts
  resources :recommend_gifts
 
end
