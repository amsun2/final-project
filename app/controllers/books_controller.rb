class BooksController < ApplicationController

  def details
    render({ :template => "books/details.html.erb"})
  end

end
