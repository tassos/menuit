Menuit::Application.routes.draw do
  resources :beers 
  
  root to: 'welcome#index'
end
