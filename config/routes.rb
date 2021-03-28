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
