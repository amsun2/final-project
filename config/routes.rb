Rails.application.routes.draw do

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
