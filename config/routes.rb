Rails.application.routes.draw do
  resources :short_links, only: [:new, :create, :show, :redirect]

  # Redirect root to the create new short link page.
  root 'short_links#new'

  match ':not_found' => 'short_links#redirect', via: :get,
        :constraints => { :not_found => /.*/ }

end
