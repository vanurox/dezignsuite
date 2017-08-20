Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
  	root "dashboard#index"
  	resources :testimonials
  	resources :galleries
    resources :workshops, only: [:index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#home"
  get "/about_us", to: "pages#about_us"
  get "/contact", to: "pages#contact"
  get "/blog", to: "pages#blog"
  get "/career",to: "pages#career"
  resources :workshops, only: [:create]
  get "/workshop", to: "workshops#workshop"
  get "/college_workshop", to: "workshops#college_workshop"
  get "/school_workshop", to: "workshops#school_workshop"
  get "/corporate_workshop", to: "workshops#corporate_workshop"
  resources :student_enrollments, only: [:new,:create] do
  	member do
  		get "payment"
  	end
  end
end
