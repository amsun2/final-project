class TbrsController < ApplicationController
  def index
    matching_tbrs = Tbr.where({ :user_id => session[:user_id] })

    @list_of_tbrs = matching_tbrs.order({ :created_at => :desc })

    render({ :template => "tbrs/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_tbrs = Tbr.where({ :id => the_id })

    @the_tbr = matching_tbrs.at(0)

    render({ :template => "tbrs/show.html.erb" })
  end

  def create
    the_tbr = Tbr.new
    the_tbr.user_id = session[:user_id]
    the_tbr.book_id = params.fetch("query_book_id")

    if the_tbr.valid?
      the_tbr.save
      redirect_to("/", { :notice => "Book added to shelf." })
    else
      redirect_to("/tbrs", { :alert => the_tbr.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_tbr = Tbr.where({ :id => the_id }).at(0)

    the_tbr.user_id = params.fetch("query_user_id")
    the_tbr.book_id = params.fetch("query_book_id")

    if the_tbr.valid?
      the_tbr.save
      redirect_to("/tbrs/#{the_tbr.id}", { :notice => "Shelf updated successfully."} )
    else
      redirect_to("/tbrs/#{the_tbr.id}", { :alert => the_tbr.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_tbr = Tbr.where({ :id => the_id }).at(0)

    the_tbr.destroy

    redirect_to("/", { :notice => "Removed from shelf successfully."} )
  end

  def move
    the_id = params.fetch("path_id")
    the_tbr = Tbr.where({ :id => the_id }).at(0)

    the_completed = Completed.new
    the_completed.book_id = params.fetch("query_book_id")
    the_completed.user_id = params.fetch("query_user_id")

    if the_completed.valid?
      the_completed.save
      the_tbr.destroy
      redirect_to("/", { :notice => "Moved to shelf successfully." })
    else
      redirect_to("/", { :alert => the_completed.errors.full_messages.to_sentence })
    end
  end

end
