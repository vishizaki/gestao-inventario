Rails.application.routes.draw do
  resources :raw_materials
  devise_for :users
  patch 'raw_materials', to: 'raw_materials#add_quantity', as: :add_quantity
  patch 'opgw_box', to: 'raw_materials#sell_opgw_box', as: :sell_opgw_box
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
