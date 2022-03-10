Rails.application.routes.draw do

    namespace :api do 
      get '/ping', to: 'posts#success'
      get '/posts', to: 'posts#index'
    end

end
