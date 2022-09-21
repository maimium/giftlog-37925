Rails.application.routes.draw do
  root to: "recommend_gifts#index"
  get 'recommend_gifts/index'
  get 'received_gifts/index'
  get 'gave_gifts/index'
end
