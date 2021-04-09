Rails.application.routes.draw do

  devise_for :customers
      #   new_customer_session GET    /customers/sign_in(.:format)        devise/sessions#new
            # customer_session POST   /customers/sign_in(.:format)        devise/sessions#create
    # destroy_customer_session DELETE /customers/sign_out(.:format)       devise/sessions#destroy
     #   new_customer_password GET    /customers/password/new(.:format)   devise/passwords#new
    #   edit_customer_password GET    /customers/password/edit(.:format)  devise/passwords#edit
         #   customer_password PATCH  /customers/password(.:format)       devise/passwords#update
                            #  PUT    /customers/password(.:format)       devise/passwords#update
                            #  POST   /customers/password(.:format)       devise/passwords#create
# cancel_customer_registration GET    /customers/cancel(.:format)         devise/registrations#cancel
 #   new_customer_registration GET    /customers/sign_up(.:format)        devise/registrations#new
#   edit_customer_registration GET    /customers/edit(.:format)           devise/registrations#edit
     #   customer_registration PATCH  /customers(.:format)                devise/registrations#update
                            #  PUT    /customers(.:format)                devise/registrations#update
                            #  DELETE /customers(.:format)                devise/registrations#destroy
                            #  POST   /customers(.:format)                devise/registrations#create

  scope module: :public do
    root to: 'homes#top'
    get 'homes/about'

    resources :items, only: [:index, :show]
    #   items GET    /items(.:format)      public/items#index
       # item GET    /items/:id(.:format)  public/items#show

    # customers/unsubscribe_confirm
    resources :customers, only: [:show, :edit, :update]
    # edit_customer GET    /customers/:id/edit(.:format)  public/customers#edit
         # customer GET    /customers/:id(.:format)       public/customers#show
                 #  PATCH  /customers/:id(.:format)       public/customers#update
                 #  PUT    /customers/:id(.:format)       public/customers#update

    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :update, :destroy, :create]
    #   cart_items GET    /cart_items(.:format)      public/cart_items#index
                #  POST   /cart_items(.:format)      public/cart_items#create
     #   cart_item PATCH  /cart_items/:id(.:format)  public/cart_items#update
                #  PUT    /cart_items/:id(.:format)  public/cart_items#update
                #  DELETE /cart_items/:id(.:format)  public/cart_items#destroy

    post '/orders_confirm' => 'orders#orders_confirm'
    get '/orders/thanks' => 'orders#thanks'
    resources :orders, except: [:edit, :update, :destroy]
    #   orders GET    /orders(.:format)      public/orders#index
            #  POST   /orders(.:format)      public/orders#create
 #   new_order GET    /orders/new(.:format)  public/orders#new
     #   order GET    /orders/:id(.:format)  public/orders#show

  end

  namespace :admin do
    root to: 'homes#top'
    resources :items, except: [:destroy]
              # admin_items GET    /admin/items(.:format)          admin/items#index
                          # POST   /admin/items(.:format)          admin/items#create
           # new_admin_item GET    /admin/items/new(.:format)      admin/items#new
          # edit_admin_item GET    /admin/items/:id/edit(.:format) admin/items#edit
               # admin_item GET    /admin/items/:id(.:format)      admin/items#show
                          # PATCH  /admin/items/:id(.:format)      admin/items#update
                          # PUT    /admin/items/:id(.:format)      admin/items#update

    resources :customers, except: [:new, :create, :destroy]
            #  admin_customers GET    /admin/customers(.:format)           admin/customers#index
        #  edit_admin_customer GET    /admin/customers/:id/edit(.:format)  admin/customers#edit
            #   admin_customer GET    /admin/customers/:id(.:format)       admin/customers#show
                            #  PATCH  /admin/customers/:id(.:format)       admin/customers#update
                            #  PUT    /admin/customers/:id(.:format)       admin/customers#update

  end

  devise_for :admin
        # new_admin_session GET    /admin/sign_in(.:format)       devise/sessions#new
            # admin_session POST   /admin/sign_in(.:format)       devise/sessions#create
    # destroy_admin_session DELETE /admin/sign_out(.:format)      devise/sessions#destroy
       # new_admin_password GET    /admin/password/new(.:format)  devise/passwords#new
      # edit_admin_password GET    /admin/password/edit(.:format) devise/passwords#edit
           # admin_password PATCH  /admin/password(.:format)      devise/passwords#update
                          # PUT    /admin/password(.:format)      devise/passwords#update
                          # POST   /admin/password(.:format)      devise/passwords#create
# cancel_admin_registration GET    /admin/cancel(.:format)        devise/registrations#cancel
   # new_admin_registration GET    /admin/sign_up(.:format)       devise/registrations#new
  # edit_admin_registration GET    /admin/edit(.:format)          devise/registrations#edit
       # admin_registration PATCH  /admin(.:format)               devise/registrations#update
                          # PUT    /admin(.:format)               devise/registrations#update
                          # DELETE /admin(.:format)               devise/registrations#destroy
                          # POST   /admin(.:format)               devise/registrations#create

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
