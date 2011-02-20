Epure::Application.routes.draw do
  resources :schedules do
    resources :entries
    
    get "color_schemes", :to => "color_schemes#index"
    put "color_schemes", :to => "color_schemes#update"
    post "color_schemes/reset", :to => "color_schemes#reset"
  end
  
  # post "/:slug.:format", :to => "schedules#show", :as => :generate_schedule
  match "/:slug", :to => "schedules#show", :as => :schedule
  root :to => "schedules#index"
end
