require 'sidekiq/web'
Rails.application.routes.draw do
  # mount Ckeditor::Engine => '/ckeditor'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount Sidekiq::Web => '/sidekiq'

  resources :books do
    member do
      get 'download_pdf'
    end
  end

  resources :foods

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "homes#index"
  resources :homes
  resources :uploads
  resources :authors

  get 'facebook_data' ,to: 'homes#facebook_data'
  resources :books
  get 'download_csv', to: 'books#download_csv'
  get 'download_pdf', to: 'books#download_pdf'
  get 'delete_all_authors', to: 'authors#delete_all_authors'
  delete 'author_delete', to: 'authors#author_delete'
  get 'download_author_pdf', to: 'uploads#download_author_pdf'
  get 'download_author_csv', to: 'uploads#download_author_csv'

  post 'import_csv', to: 'books#import_csv'
  get 'delete_all_book', to: 'books#delete_all_book'
  get 'show_specific_language', to: 'books#show_specific_language'
  get 'chatgpt', to: 'homes#chatgpt'
  post 'process_import_csv', to: 'books#process_import_csv'
  post 'process_uploads', to: 'uploads#process_uploads'

  # resources :books do
  #   collection do
  #     post :process_import_csv
  #     get :import_csv
  #   end
  # end

  # resources :uploads, only: [:new, :create] do
  #   collection do
  #     post :process_uploads
  #   end
  # end

end
