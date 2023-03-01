class UsersController < ApplicationController

  def index
    render({ :template => "users/index.html.erb"})
  end

  def sign_up
    render({ :template => "users/sign_up.html.erb"})
  end

  def sign_in
    render({ :template => "users/sign_in.html.erb"})
  end

  def sign_out
    reset_session
    redirect_to("/", {:notice => "Toodaloo!"})
  end

end
