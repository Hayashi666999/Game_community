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

  namespace :admins do
    get '' => 'homes#top'
    resources :genres
    resources :customers
  end

  namespace :public do
    resources :genres
    resources :post
    get '/customers/mypage' => 'customers#show'
    get '/customers/information/edit' => 'customers#edit'
    patch '/customers/information' => 'customers#update'
    get '/customers/unsubscribe_confirm' => 'customers#unsubscribe_confirm'
    patch '/customers/unsubscribe' => 'customers#unsubscribe'
    get '/about' => 'homes#about'
  end

end
