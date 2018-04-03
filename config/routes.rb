Rails.application.routes.draw do
  devise_for :users do
  #マッチング機能のためのrouting
    member do
     get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  #ユーザー情報登録のためのrouting
  resources :users, only: [:show] do
    resources :user_images, only: [:create]
    resources :details, only: [:edit, :update]
  end
  #検索機能関連のrouting
  get 'searches' =>  'searches#search_index'
  get 'search_result' => 'searches#search_result'
  #その他
  root 'pairs#index'
  resources :groups do
    resources :messages, only: [:index,:create]
  end
  resources:relationships, only: [:create, :destroy]

  get 'messages' => 'pairs#messages_index'
  get 'violation' => 'pairs#violation'
  #いいね関連のrouting
  get 'like/from_partner' => 'pairs#from_partner'
  get 'like/from_me'  => 'pairs#from_me'
  get 'like/favorite' => 'pairs#favorite'
  #自分・異性の詳細ページ関連のrouting
  get "myprofile" => "pairs#myprofile"
  get "searchone" => "pairs#search_one"
  #足あと関連のrouting
  get "createfoot" => "pairs#create_foot"
  get "visitorlist" => "pairs#visitor_list"
  get "visitorsetting" => "pairs#visitor_setting"
  #各種設定関連のrouting
  get "privacysetting" => "pairs#privacy_setting"
  get "dislikeuserlist/hide" => "pairs#hide"
  get "dislikeuserlist/block" => "pairs#block"
  #membership関連のrouting
  get "membership/aboutpoint" => "pairs#about_point"
  get "membership/aboutallpoint" => "pairs#about_all_point"
  get "membership/pointlog" => "pairs#point_log"
  get "membership/status" => "pairs#status"
  get "membership/aboutladys" => "pairs#about_ladys"
  get "membership/aboutpremium" => "pairs#about_premium"
  get "membership/aboutpaid" => "pairs#about_paid"
  get "membership/aboutprivate" => "pairs#about_private"
  get "membership/aboutageproof" => "pairs#about_age_proof"
  get "pairsstore" => "pairs#pairs_store"
  #コミュニティ関連のrouting
  get "community/create" => "communities#new"
  get "community/complete" => "communities#complete"
  resources :communities, path: "community", only: [:index, :create, :show] do
    collection do
      get  "search"
      post "confirm"
    end
    member do
      get "join"
      get "leave"
    end
  end
end
