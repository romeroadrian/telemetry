Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    scope :v1 do
      resources :installations, only: [:create, :update]
    end
  end
end
