Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "index"})

  #User routes 

  # Create
  get("/insert_user_record", {:controller => "users", :action => "create"})
  get("/user_sign_up", {:controller => "users", :action => "sign_up"}) 
  get("/user_sign_out", {:controller => "users", :action => "sign_out"})

  # post("/verify_credentials", {:controller => "users", :action => "authenticate"})





end
