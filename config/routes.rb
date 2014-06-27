Rails.application.routes.draw do

  resources :contacts, :only => [:show, :index, :new, :edit, :create, :update]

end
