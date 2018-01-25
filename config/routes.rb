ReservationsApp::Application.routes.draw do

  get 'reservation/all' => 'reservations#all'
  get 'reservations/:id/confirmation' => 'reservations#send_confirmation', as: 'send_confirmation'
  get 'reservations/:id/cancellation' => 'reservations#send_cancellation', as: 'send_cancellation'
  resources :reservations
  devise_for :users
  root 'reservations#index'
  

end
