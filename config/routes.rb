Rails.application.routes.draw do
  resources :short_links, only: [:new, :create, :show]

  # Redirect root to the create new short link page.
  root to: 'short_links#new'

end
