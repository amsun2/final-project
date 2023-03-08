class CompletedsController < ApplicationController
  def index
    matching_completeds = Completed.where({ :user_id => session[:user_id] })

    @list_of_completeds = matching_completeds.order({ :created_at => :desc })

    render({ :template => "completeds/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_completeds = Completed.where({ :id => the_id })

    @the_completed = matching_completeds.at(0)

    render({ :template => "completeds/show.html.erb" })
  end

  def create
    the_completed = Completed.new
    the_completed.book_id = params.fetch("query_book_id")
    the_completed.user_id = params.fetch("query_user_id")

    if the_completed.valid?
      the_completed.save
      redirect_to("/", { :notice => "Moved to shelf successfully." })
    else
      redirect_to("/", { :alert => the_completed.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_completed = Completed.where({ :id => the_id }).at(0)

    the_completed.book_id = params.fetch("query_book_id")
    the_completed.user_id = params.fetch("query_user_id")

    if the_completed.valid?
      the_completed.save
      redirect_to("/completeds/#{the_completed.id}", { :notice => "Completed updated successfully."} )
    else
      redirect_to("/completeds/#{the_completed.id}", { :alert => the_completed.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("completed_id")
    the_user = params.fetch("user_id")
    the_book = params.fetch("book_id")

    the_completed = Completed.where({ :id => the_id }).at(0)
    the_review = Review.where({ :user_id => the_user, :book_id => the_book}).at(0)

    the_completed.destroy
    the_review.destroy

    redirect_to("/", { :notice => "Removed from shelf successfully."} )
  end

end
