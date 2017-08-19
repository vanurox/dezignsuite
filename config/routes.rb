Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
  	root "dashboard#index"
  	resources :testimonials
  	resources :galleries
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#home"
  get "/about_us", to: "pages#about_us"
  get "/contact", to: "pages#contact"
  get "/blog", to: "pages#blog"
  get "/career",to: "pages#career"
  resources :student_enrollments, only: [:new,:create]
end
