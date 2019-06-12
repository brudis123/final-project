Rails.application.routes.draw do
  # Routes for the Comment resource:

  # CREATE
  match("/new_comment_form", { :controller => "comments", :action => "blank_form", :via => "get" })
  match("/insert_comment_record", { :controller => "comments", :action => "save_new_info", :via => "post" })

  # READ
  match("/comments", { :controller => "comments", :action => "list", :via => "get" })
  match("/comments/:id_to_display", { :controller => "comments", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_comment_form/:id_to_prefill", { :controller => "comments", :action => "prefilled_form", :via => "get" })
  match("/update_comment_record/:id_to_modify", { :controller => "comments", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_comment/:id_to_remove", { :controller => "comments", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the Address resource:

  # CREATE
  match("/new_address_form", { :controller => "addresses", :action => "blank_form", :via => "get" })
  match("/insert_address_record", { :controller => "addresses", :action => "save_new_info", :via => "post" })

  # READ
  match("/addresses", { :controller => "addresses", :action => "list", :via => "get" })
  match("/addresses/:id_to_display", { :controller => "addresses", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_address_form/:id_to_prefill", { :controller => "addresses", :action => "prefilled_form", :via => "get" })
  match("/update_address_record/:id_to_modify", { :controller => "addresses", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_address/:id_to_remove", { :controller => "addresses", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the Restaurant resource:

  # CREATE
  match("/new_restaurant_form", { :controller => "restaurants", :action => "blank_form", :via => "get" })
  match("/insert_restaurant_record", { :controller => "restaurants", :action => "save_new_info", :via => "post" })

  # READ
  match("/restaurants", { :controller => "restaurants", :action => "list", :via => "get" })
  match("/restaurants/:id_to_display", { :controller => "restaurants", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_restaurant_form/:id_to_prefill", { :controller => "restaurants", :action => "prefilled_form", :via => "get" })
  match("/update_restaurant_record/:id_to_modify", { :controller => "restaurants", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_restaurant/:id_to_remove", { :controller => "restaurants", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the Dish resource:

  # CREATE
  match("/new_dish_form", { :controller => "dishes", :action => "blank_form", :via => "get" })
  match("/insert_dish_record", { :controller => "dishes", :action => "save_new_info", :via => "post" })

  # READ
  match("/dishes", { :controller => "dishes", :action => "list", :via => "get" })
  match("/", { :controller => "dishes", :action => "list", :via => "get" })
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
