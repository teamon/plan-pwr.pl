Epure::Application.routes.draw do
  resources :schedules

  resources :schedules do
    resources :entries, :except => [:show] do
      collection do
        get :search_course_names
        get :search_lecturers
      end
    end
    
    get "color_schemes", :to => "color_schemes#index"
    post "color_schemes/reset", :to => "color_schemes#reset"
    post "color_schemes/bw", :to => "color_schemes#bw"
  end
  
  get "/:slug", :to => "schedules#show", :as => :schedule_slug
  root :to => "schedules#index"
end
