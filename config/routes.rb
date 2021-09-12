Rails.application.routes.draw do


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users do
      collection do
        get '/login',to:'users/sessions#new'
        post '/login',to:'users/sessions#create'
      end
      member do
        delete '/logout',to:'users/sessions#destroy'
      end
  end

  namespace :questions do
    resources :searchs, only:[:index]
  end

  resources :questions do
    
      member do
        get 'make_solved'
      end

      collection do  
        get 'solved'
        get 'unsolved'
      end

      resources :answers, only:[:create,:destroy], module: "questions"
  end
end
