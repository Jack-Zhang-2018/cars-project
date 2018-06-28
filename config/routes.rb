Rails.application.routes.draw do
  get '/' => 'cars#create'
  get '/status'=> 'cars#status'

  get '/cars/accelerate' => 'cars#accelerate'
  get '/cars/light_switch' => 'cars#light_switch'
  get '/cars/brake' => 'cars#brake'
  
  get '/create' => 'cars#create'
  get '/new' => 'cars#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
