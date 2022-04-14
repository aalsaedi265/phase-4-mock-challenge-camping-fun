Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :campers, only: [:index, :show, :create]

  resources :activities, only: [:index, :destroy]

  resources :signups, only: [:create]
end



# rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

# rescue_from ActiveRecord::RecordNotFound, with: :not_found