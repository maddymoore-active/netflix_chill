Rails.application.routes.draw do
  # Routes for the Movie resource:

  # CREATE
  get("/movies/new", { :controller => "movies", :action => "new_form" })
  post("/create_movie", { :controller => "movies", :action => "create_row" })

  # READ
  get("/movies", { :controller => "movies", :action => "index" })
  get("/movies/:id_to_display", { :controller => "movies", :action => "show" })

  # UPDATE
  get("/movies/:prefill_with_id/edit", { :controller => "movies", :action => "edit_form" })
  post("/update_movie/:id_to_modify", { :controller => "movies", :action => "update_row" })

  # DELETE
  get("/delete_movie/:id_to_remove", { :controller => "movies", :action => "destroy_row" })

  #------------------------------

  # Routes for the Show resource:

  # CREATE
  get("/shows/new", { :controller => "shows", :action => "new_form" })
  post("/create_show", { :controller => "shows", :action => "create_row" })

  # READ
  get("/shows", { :controller => "shows", :action => "index" })
  get("/shows/:id_to_display", { :controller => "shows", :action => "show" })

  # UPDATE
  get("/shows/:prefill_with_id/edit", { :controller => "shows", :action => "edit_form" })
  post("/update_show/:id_to_modify", { :controller => "shows", :action => "update_row" })

  # DELETE
  get("/delete_show/:id_to_remove", { :controller => "shows", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
