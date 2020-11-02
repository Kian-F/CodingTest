Rails.application.routes.draw do
  root to: "people#index"
  get 'people/index'
  get 'people/import' => 'people#my_import'

  resources :people do
    collection {post :import}
end
end