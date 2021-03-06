Rails.application.routes.draw do

  get 'admin/index'

  resources :user_subjects
  resources :subjects
  resources :semisters
  resources :courses
  resources :universities
  get '/get_university_courses/:id', to:"semisters#get_university_courses"
  get '/get_course_semisters/:id', to:"subjects#get_course_semisters"
  get 'get_semister_subject_checkbox/:id', to: "welcome#get_semister_subject_checkbox"

  devise_for :users, controllers: {sessions: "users/sessions", registrations: "users/registrations", passwords: "users/passwords", confirmations: "users/confirmations", unlocks: "users/unlocks"}, path_names: {sign_in: "login", sign_out: "logout", sign_up: "user/registration"}

  authenticated do
    devise_scope :user do
      authenticated :user, ->(u) { u.has_role? :admin } do
        root to: "admin#index", as: :admin_root
      end
      authenticated :user, ->(u) { u.has_role? :student   } do
        root to: "welcome#index", as: :student_root
        put "/update_user_subjects/:id", to: "welcome#update_user_subjects", as: "update_user_subjects"
      end
      authenticated :user, ->(u) { u.has_role? :faculty   } do
        root to: "welcome#index", as: :faculty_root
      end

    end
  end


  unauthenticated do
    devise_scope :user do
      root to: "users/sessions#new", :as => "unauthenticated"
    end
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
