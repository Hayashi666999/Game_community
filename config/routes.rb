Rails.application.routes.draw do
  #devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "public/homes#top"

  devise_for :customers
  #devise_for :customers,skip: [:passwords], controllers: {
    #registrations: "public/registrations",
    #sessions: 'public/sessions'
  #}

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admins/sessions"
  }


  resources :posts do
    resource :nices, only:[:create, :destroy], controller: 'public/nices'
  end

  namespace :admins do
    get '' => 'homes#top'
    resources :genres
    resources :customers
    resources :posts
  end

  namespace :public do
    post 'posts/create' => 'post#create', as: :post_create
    resources :genres
    resources :post do
      get :search, on: :collection
      resources :comments, only: [:index, :create, :destroy]
    end
    resources :nices, only: [:index]
    get '/post_page' => 'post#post_page'
    get '/customers/mypage' => 'customers#show'
    get '/customers/information/edit' => 'customers#edit'
    patch '/customers/information' => 'customers#update'
    get '/customers/unsubscribe_confirm' => 'customers#unsubscribe_confirm'
    patch '/customers/unsubscribe' => 'customers#unsubscribe'
  end

end
