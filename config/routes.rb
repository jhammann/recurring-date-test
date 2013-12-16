DateTest::Application.routes.draw do

  resources :dateslots

  get "overview" => "dateslots#overview", :as => "overview"

  root :to => 'dateslots#index'

end
