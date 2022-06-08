Rails.application.routes.draw do
  
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root to: 'homes#top'
  #home
  get "home/about" => 'homes#about'


  namespace :admin do
    #ジャンル
    resources :genres
    post 'genres/index' => 'genres#index'
  end

  namespace :public do
    #質問
    resources :questions , only: [:show, :new, :create, :index]
    #会員
    resources :customers , only: [:show, :edit, :update]
    get "customers/:id/quit" => 'customers#quit'
    patch "customers/:id/quit" => 'customers#withdraw'
    #回答
    resources :answers , only: [:update, :destroy, :create, :index]
    #ジャンル
    resources :genres, omly: [:index,:show]
    #検索
    get "search" => "searches#search"
  end

end
