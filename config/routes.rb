# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  resources :issue_categories do
    member do
      post 'archive'
      post 'unarchive'
    end
  end
end