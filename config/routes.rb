Rails.application.routes.draw do

  get("/", { :controller => "profiles", :action => "profile"})

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })

  #------------------------------
  
  # Routes for the Author resource:

  # CREATE
  post("/insert_author", { :controller => "authors", :action => "create" })
          
  # READ
  get("/authors", { :controller => "authors", :action => "index" })
  
  get("/authors/:path_id", { :controller => "authors", :action => "show" })
  
  # UPDATE
  
  post("/modify_author/:path_id", { :controller => "authors", :action => "update" })
  

  #------------------------------

  # Routes for the Book resource:

  # CREATE
  post("/insert_book", { :controller => "books", :action => "create" })
          
  # READ
  get("/books", { :controller => "books", :action => "index" })
  
  get("/books/:path_id", { :controller => "books", :action => "show" })
  
  # UPDATE
  
  post("/modify_book/:path_id", { :controller => "books", :action => "update" })
  

  #------------------------------

  # Routes for the Review resource:

  # CREATE
  post("/insert_review", { :controller => "reviews", :action => "create" })
          
  # READ
  get("/reviews", { :controller => "reviews", :action => "index" })
  
  get("/reviews/:path_id", { :controller => "reviews", :action => "show" })
  
  # UPDATE
  
  post("/modify_review/:path_id", { :controller => "reviews", :action => "update" })
  
  # DELETE
  get("/delete_review/:path_id", { :controller => "reviews", :action => "destroy" })

    #------------------------------

    # Routes for the Tbr resource:

  # CREATE
  post("/insert_tbr", { :controller => "tbrs", :action => "create" })

  post("/move_to_completed/:path_id", { :controller => "tbrs", :action => "move" })
          
  # READ
  get("/tbrs", { :controller => "tbrs", :action => "index" })
  
  get("/tbrs/:path_id", { :controller => "tbrs", :action => "show" })
  
  # UPDATE
  
  post("/modify_tbr/:path_id", { :controller => "tbrs", :action => "update" })
  
  # DELETE
  get("/delete_tbr/:path_id", { :controller => "tbrs", :action => "destroy" })

  #------------------------------

  # Routes for the Completed resource:

  # CREATE
  post("/insert_completed", { :controller => "completeds", :action => "create" })
          
  # READ
  get("/completeds", { :controller => "completeds", :action => "index" })
  
  get("/completeds/:path_id", { :controller => "completeds", :action => "show" })
  
  # UPDATE
  
  post("/modify_completed/:path_id", { :controller => "completeds", :action => "update" })
  
  # DELETE
  get("/delete_completed/:completed_id/:book_id/:user_id", { :controller => "completeds", :action => "destroy" })

  #------------------------------

    # Routes for the Genre list resource:

  # CREATE
  post("/insert_genre_list", { :controller => "genre_lists", :action => "create" })
          
  # READ
  get("/genre_lists", { :controller => "genre_lists", :action => "index" })
  
  get("/genre_lists/:path_id", { :controller => "genre_lists", :action => "show" })
  
  # UPDATE
  
  post("/modify_genre_list/:path_id", { :controller => "genre_lists", :action => "update" })
  
  # DELETE
  get("/delete_genre_list/:path_id", { :controller => "genre_lists", :action => "destroy" })

  #------------------------------

  # Routes for the Genre resource:

  # CREATE
  post("/insert_genre", { :controller => "genres", :action => "create" })
          
  # READ
  get("/genres", { :controller => "genres", :action => "index" })
  
  get("/genres/:path_id", { :controller => "genres", :action => "show" })
  
  # UPDATE
  
  post("/modify_genre/:path_id", { :controller => "genres", :action => "update" })
  
  # DELETE
  get("/delete_genre/:path_id", { :controller => "genres", :action => "destroy" })

  #------------------------------

end
