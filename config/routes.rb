Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    root :to => "devise/sessions#new"
  end

  resources :gave_gifts
  resources :received_gifts
  resources :recommend_gifts, only:[:index, :show]
 
end
