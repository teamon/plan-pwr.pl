Epure::Application.routes.draw do
  resources :schedules do
    
    
    resources :entries
  end
  
  # post "/:hash.:format", :to => "schedules#show", :as => :generate_schedule
  match "/:hash", :to => "schedules#show", :as => :schedule
  root :to => "schedules#new"
end
