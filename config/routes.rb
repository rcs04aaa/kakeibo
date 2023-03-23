Rails.application.routes.draw do
  #会員用
  devise_for :users, controllers: {
    sessions: 'public/users/sessions',
    registrations: 'public/users/registrations'
  }

  #管理者用
  devise_for :admin, skip: [:passwords, :registrations], controllers: {
    sessions: 'admin/sessions'
  }

  scope module: :public do

    devise_scope :user do  #ゲストログイン用
      post 'users/guest_sign_in' => 'users/sessions#new_guest'
    end
    root to: 'homes#top'
    resources :posts do
      collection do
        get :date
        get :bookmarks
      end
      member do 
        patch :bookmark
      end
    end
    
    get 'users/my_page' => 'users#show'
    get '/users/information/edit' => 'users#edit'
    patch 'users/information' => 'users#update'
    get 'search' => 'searches#new'
    get 'search_result' => 'searches#index'
  end

  namespace :admin do
    get 'top' => 'homes#top'
  end

end
