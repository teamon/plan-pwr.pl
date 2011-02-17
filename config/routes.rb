Epure::Application.routes.draw do
  resources :schedules
  
  match "/:hash", :to => "schedules#show", :as => :schedule
  root :to => "schedules#new"
end
