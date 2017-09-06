Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
  	root "student_enrollments#index"
  	resources :testimonials
    resources :courses
  	resources :galleries do
      member do
        get "publish"
        get "unpublish"
      end
    end
    resources :student_enrollments, only: [:index, :show, :destroy]
    resources :workshops, only: [:index, :show, :destroy]
    resources :programs, only: [:index, :show, :destroy]
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
  get "/program", to: "programs#program"
  get "/inhouse_training_program", to: "programs#inhouse_program"
  get "/joboriented_training_program", to: "programs#job_program"
  get "/corporate_training_program", to: "programs#corporate_program"
  get "/courses", to: "pages#courses"
  get "/c_course", to: "pages#c_course"
  get "/cplus_course", to: "pages#cplus_course"
  get "/bigdata_course", to: "pages#bigdata_course"
  get "/dotnet_course", to: "pages#dotnet_course"
  get "/android_course", to: "pages#android_course"
  get "/ios_course", to: "pages#ios_course"
  get "/networking_course", to: "pages#networking_course"
  get "/tally_course", to: "pages#tally_course"
  get "/java_course", to: "pages#java_course"
  get "/digital_marketing_course", to: "pages#digital_marketing_course"
  get "/embedded_system_course", to: "pages#embedded_system_course"
  get "/php_course", to: "pages#php_course"
  get "/python_course", to: "pages#python_course"
  get "/software_testing_course", to: "pages#software_testing_course"
  get "/web_designing_course", to: "pages#web_designing_course"
  get "/business_analyst_course", to: "pages#business_analyst_course"
  get "/oracle_course", to: "pages#oracle_course"
  get "/cloud_computing_course", to: "pages#cloud_computing_course"
  get "/services", to: "pages#services"
  get "/software_development_and_testing", to: "pages#testing_services"
  get "/enterprise_mobility", to: "pages#enterprise_services"
  get "/digital_marketing", to: "pages#digital_marketing_services"
  get "/training_and_certification", to: "pages#training_services"
  get "/recruitment_and_staffing", to: "pages#recruitment_services"
  get "/online_reputation_management", to: "pages#online_reputation_services"
  get "/seo", to: "pages#seo_services"
  get "/smo", to: "pages#smo_services"
  get "/pay_per_click", to: "pages#pay_per_click_services"
  resources :workshops, only: [:create]
  resources :careers, only: [:create]
  resources :contacts, only: [:create]
  resources :programs, only: [:create]
  resources :student_enrollments, only: [:new,:create] do
  	member do
  		get "payment"
  	end
  end
end
