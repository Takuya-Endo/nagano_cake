Rails.application.routes.draw do

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
