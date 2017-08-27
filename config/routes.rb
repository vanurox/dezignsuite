Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
  	root "student_enrollments#index"
  	resources :testimonials
  	resources :galleries do
      member do
        get "publish"
        get "unpublish"
      end
    end
    resources :student_enrollments, only: [:index, :show, :destroy]
    resources :workshops, only: [:index, :show, :destroy]
    resources :careers, only: [:index, :show, :destroy]
    resources :contacts, only: [:index, :show, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#home"
  get "/about_us", to: "pages#about_us"
  get "/blog", to: "pages#blog"
  get "/workshop", to: "workshops#workshop"
  get "/college_workshop", to: "workshops#college_workshop"
  get "/school_workshop", to: "workshops#school_workshop"
  get "/corporate_workshop", to: "workshops#corporate_workshop"
  get "/contact", to: "contacts#contact"
  get "/career", to: "careers#career"
  resources :workshops, only: [:create]
  resources :careers, only: [:create]
  resources :contacts, only: [:create]
  resources :student_enrollments, only: [:new,:create] do
  	member do
  		get "payment"
  	end
  end
end
