class AuthorsController < ApplicationController

  def details
    render({ :template => "authors/details.html.erb"})
  end

end
