Rails.application.routes.draw do
  root :to => "shows#index"
  # Routes for the Like resource:

  # CREATE
  get("/likes/new", { :controller => "likes", :action => "new_form" })
  post("/create_like", { :controller => "likes", :action => "create_row" })

  # READ
  get("/likes", { :controller => "likes", :action => "index" })
  get("/likes/:id_to_display", { :controller => "likes", :action => "show" })

  # UPDATE
  get("/likes/:prefill_with_id/edit", { :controller => "likes", :action => "edit_form" })
  post("/update_like/:id_to_modify", { :controller => "likes", :action => "update_row" })

  # DELETE
  get("/delete_like/:id_to_remove", { :controller => "likes", :action => "destroy_row" })

  #------------------------------

  # Routes for the Match resource:

  # CREATE
  get("/matches/new", { :controller => "matches", :action => "new_form" })
  post("/create_match", { :controller => "matches", :action => "create_row" })

  # READ
  get("/matches", { :controller => "matches", :action => "index" })
  get("/matches/:id_to_display", { :controller => "matches", :action => "show" })

  # UPDATE
  get("/matches/:prefill_with_id/edit", { :controller => "matches", :action => "edit_form" })
  post("/update_match/:id_to_modify", { :controller => "matches", :action => "update_row" })

  # DELETE
  get("/delete_match/:id_to_remove", { :controller => "matches", :action => "destroy_row" })

  #------------------------------

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
