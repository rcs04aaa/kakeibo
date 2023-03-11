Rails.application.routes.draw do
  devise_for :users
  #for user


  scope module: :public do
    root to: 'homes#top'
    resources :posts
    get 'users/my_page' => 'users#show'
    get '/users/information/edit' => 'users#edit'
    patch 'users/information' => 'users#update'
    get 'search' => 'searches#search'
    resources :favorites, only: [:create, :destory]
  end



  namespace :admin do
    get 'top' => 'homes#top'
  end

end
