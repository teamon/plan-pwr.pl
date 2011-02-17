Epure::Application.routes.draw do
  resources :schedules do
    member do
      get :generate
    end
    
    resources :entries
  end
  
  match "/:hash", :to => "schedules#show", :as => :schedule
  root :to => "schedules#new"
end
