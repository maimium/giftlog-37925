Rails.application.routes.draw do
  root "recommend_gifts#index"
  get 'recommend_gifts/index'
  get 'received_gifts/index'
  get 'gave_gifts/index'
end
