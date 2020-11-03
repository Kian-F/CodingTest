Rails.application.routes.draw do
  get 'affiliations/index'
  get 'affiliations/show'
  get 'locations/index'
  get 'locations/import' => 'location#my_import'
  get 'location/show'
  get 'pages/home'
  root to: "people#index"
  get 'people/index'
  get 'people/import' => 'people#my_import'
  
  resources :people do
    collection {post :import}
  
end
resources :locations do
  collection{post :import}
end
end