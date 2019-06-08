Rails.application.routes.draw do
  # Routes for the Dish resource:

  # CREATE
  match("/new_dish_form", { :controller => "dishes", :action => "blank_form", :via => "get" })
  match("/insert_dish_record", { :controller => "dishes", :action => "save_new_info", :via => "post" })

  # READ
  match("/dishes", { :controller => "dishes", :action => "list", :via => "get" })
  match("/dishes/:id_to_display", { :controller => "dishes", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_dish_form/:id_to_prefill", { :controller => "dishes", :action => "prefilled_form", :via => "get" })
  match("/update_dish_record/:id_to_modify", { :controller => "dishes", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_dish/:id_to_remove", { :controller => "dishes", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the Cuisine resource:

  # CREATE
  match("/new_cuisine_form", { :controller => "cuisines", :action => "blank_form", :via => "get" })
  match("/insert_cuisine_record", { :controller => "cuisines", :action => "save_new_info", :via => "post" })

  # READ
  match("/cuisines", { :controller => "cuisines", :action => "list", :via => "get" })
  match("/cuisines/:id_to_display", { :controller => "cuisines", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_cuisine_form/:id_to_prefill", { :controller => "cuisines", :action => "prefilled_form", :via => "get" })
  match("/update_cuisine_record/:id_to_modify", { :controller => "cuisines", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_cuisine/:id_to_remove", { :controller => "cuisines", :action => "remove_row", :via => "get" })

  #------------------------------

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'photos#index'
end
