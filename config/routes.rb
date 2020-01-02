Rails.application.routes.draw do

  get '/', to: "home#show"

  get '/books', to: "books#index"
end
