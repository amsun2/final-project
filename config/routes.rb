Rails.application.routes.draw do

  # Routes for the Book resource:

  # CREATE
  post("/insert_book", { :controller => "books", :action => "create" })
          
  # READ
  get("/books", { :controller => "books", :action => "index" })
  
  get("/books/:path_id", { :controller => "books", :action => "show" })
  
  # UPDATE
  
  post("/modify_book/:path_id", { :controller => "books", :action => "update" })
  
  # DELETE
  get("/delete_book/:path_id", { :controller => "books", :action => "destroy" })

  #------------------------------

  get("/", { :controller => "users", :action => "index"})

  #User routes 

  # Create
  get("/insert_user_record", {:controller => "users", :action => "create"})
  get("/user_sign_up", {:controller => "users", :action => "sign_up"}) 
  get("/user_sign_in", {:controller => "users", :action => "sign_in"})
  get("/user_sign_out", {:controller => "users", :action => "sign_out"})

  # post("/verify_credentials", {:controller => "users", :action => "authenticate"})

  #Book routes 
  
  #Read
  get("/books/:book_id", { :controller => "books", :action => "details"})

 #Author routes 
  
  #Read
  get("/author/:author_id", { :controller => "authors", :action => "details"})

end
