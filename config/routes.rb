Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions:      'admin/admins/sessions',
    passwords:     'admin/admins/passwords'
  }

 namespace :admin do

   get "/" => "homes#top"
   resources :customers,only: [:index,:show,:edit,:update]
   resources :genres,only: [:index,:create,:edit,:update]
   resources :tags,only: [:index,:create,:edit,:update]
   resources :works, only: [:index,:show,:destroy]
 end

 devise_for :customers, controllers: {
   sessions:      'public/customers/sessions',
   passwords:     'public/customers/passwords',
   registrations: 'public/customers/registrations'
 }

 root to: "public/homes#top"
 get "search" => "searches#search"
 get "/about" => "public/homes#about"
 get "/follow" => "public/homes#follow"

  scope module: :public do
   get "/customers/my_page" => 'customers#mypage'
   get '/customers/history' => 'customers#history'
   get '/customers/confirm' => 'customers#confirm'
   get '/customers/like' => 'customers#like'
   patch '/customers/withdraw' => 'customers#withdraw'
   resources :customers,only: [:show,:edit,:update]do
    get :favorites, on: :collection
    resources :relationships, only: [:create, :destroy]
   end
   get '/works/ranking/:ranking_name' => 'works#ranking', as: 'works_ranking'
   resources :works, only: [:index,:show,:create,:new,:edit,:update,:destroy]do
    resources :reviews,only: [:index,:show,:new,:create,:destroy]do
     resources :comments,only: [:create,:destroy]
   end
    resources :favorites, only: [:create, :destroy]
   end
   resources :rooms,only: [:index]

   get 'chat/:id' => 'chats#show', as: 'chat'
   delete 'chat/:id' => 'chats#destroy'
   resources :chats, only: [:create]

 end

end
