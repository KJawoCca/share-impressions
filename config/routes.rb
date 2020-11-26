Rails.application.routes.draw do
  get 'reviews/index'
  root to: "reviews#index"
end
