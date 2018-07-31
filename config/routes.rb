Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        omniauth_callbacks: "users/omniauth_callbacks"
      }

  resources :blogs do
  	resources :posts do
  		resources :comments
      member do
        put "like", to: "posts#upvote"
        put "dislike", to: "posts#downvote"
      end
  	end
  end

  get 'blogs/:id/visited_view' => "blogs#visited_view", :as => :visited_view
  get 'blogs/:id/recent_view' => "blogs#recent_view", :as => :recent_view

  resources :users

  resources :tags, only: [:index, :show]

  get 'blogs/index'
  root 'home#index'
end
