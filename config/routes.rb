Epure::Application.routes.draw do
  resources :schedules do
    resources :entries
  end
  
  # post "/:slug.:format", :to => "schedules#show", :as => :generate_schedule
  match "/:slug", :to => "schedules#show", :as => :schedule
  root :to => "schedules#new"
end
