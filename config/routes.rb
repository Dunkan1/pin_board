Rails.application.routes.draw do
  devise_for :users
  # resources :pins, to: 'pins#show', as: "pin_show"
  resources :comments
  resources :pins do
    # post '/pins', to: 'pins#create', as: 'pin_creation'
    member do
      put "like", to: "pins#upvote"
      # put 'pinsasdf', to: 'piasdfns#create', as: 'my_new_article_in_member'
    end
    resources :comments
  end
  
  post '/pins', to: 'pins#create', as: 'create_pin'
  root "pins#index"
end
