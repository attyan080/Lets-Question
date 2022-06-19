Rails.application.routes.draw do
  namespace :public do
    get 'new_questions/index'
  end
  # devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  # sessions: "admin/sessions"
  # }

  devise_for :customers, :controllers => {
    :registrations => 'customers/registrations'
   }
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

    #会員
    get "customers/:id/quit" => 'customers#quit'
    patch "customers/:id/quit" => 'customers#withdraw'
    resources :customers , only: [:show, :edit, :update]
    # get "customers/:id/question/:question_id" => 'customers#show'
    # get "customers/:id/question" => 'customers#index'
    #質問
    resources :questions do
      resources :answers, only: [:update, :destroy, :create, :index]
    end
    # 新着ページ
    resources :new_questions, only: [:index]
    #ジャンル
    resources :genres, omly: [:index,:show]
    #検索
    get "search" => "searches#search"
  end

end
