Rails.application.routes.draw do
  resources :url_generators 
  get '/:encoded_url', to:'url_generators#show'
  resources :url_generators do
    collection { post :import }
  end
  root to: "url_generators#index"
  namespace :api , format: 'json' do
  	namespace :v1 do
  		resources :url_generators do
        collection do
          get 'modified_url'
        end
      end
  	end
  end
end
