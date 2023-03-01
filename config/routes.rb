Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "profile"})
  # Routes for the Author resource:

  # CREATE
  post("/insert_author", { :controller => "authors", :action => "create" })
          
  # READ
  get("/authors", { :controller => "authors", :action => "index" })
  
  get("/authors/:path_id", { :controller => "authors", :action => "show" })
  
  # UPDATE
  
  post("/modify_author/:path_id", { :controller => "authors", :action => "update" })
  
  # DELETE
  get("/delete_author/:path_id", { :controller => "authors", :action => "destroy" })

  #------------------------------

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



end
