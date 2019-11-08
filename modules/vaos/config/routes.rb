# frozen_string_literal: true

VAOS::Engine.routes.draw do
  defaults format: :json do
    resources :appointments, only: :index
    resources :appointment_requests, only: :index
    resources :systems, only: :index
    resources :facilities, only: :index do
      resources :clinics, only: :index
      get 'visits/direct', to: 'visits#direct'
      get 'visits/request', to: 'visits#request'
    end
    get 'api', to: 'apidocs#index'
  end
end
