Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :categories
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}, skip: [:registrations]
  resources :portfolios
  root 'pages#home'

  get "about" => 'pages#about'

  get 'pages/contact'

  resources :blogs do
    member do
      get :toggle_status
    end
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '*path' => redirect('/')
end
