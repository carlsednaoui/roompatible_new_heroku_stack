Roompatible::Application.routes.draw do

    get "messages/show"

    resources :roommates
    resources :rooms
    resources :messages
    match "/dashboard" => "dashboard#index"
    match "/message_sent" => "messages#message_sent"


    match "/auth/twitter/callback" => "sessions#create"
    match "/auth/facebook/callback" => "sessions#create"
    match "/signout" => "sessions#destroy", :as => :signout
    match "/auth/failure" => "home#index"
    root :to => "home#index"

#    match '*path' => redirect('/')

    # resources :locations
    # resources :traits
    # resources :results
    # resources :quiz_attempts
    # resources :users
    # resources :questions
    # resources :quizzes

    match "/" => "home#index"   
    match "/sign-up" => "home#sign_up"   
    match "/take" => "take#new"
    match "/score" => "home#score"
    match "/complete" => "take#complete"
    match "/notify" => "take#notify"

    #Top nav
    match "/contact" => "home#contact"
    match"/what-is-roompatible" => "home#what_is_roompatible"
    match"/how-it-works" => "home#how_it_works"
end
