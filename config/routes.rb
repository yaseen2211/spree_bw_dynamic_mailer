
Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :email_contents
  end
  mount Ckeditor::Engine => '/ckeditor'
end
