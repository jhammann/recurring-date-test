DateTest::Application.routes.draw do

  resources :dateslots

  get "overview" => "dateslots#overview", :as => "overview"
  get "overview-by-event" => "dateslots#events", :as => "events"
  get "months" => "dateslots#months", :as => "months"

  root :to => 'dateslots#index'

end