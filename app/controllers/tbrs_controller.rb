class TbrsController < ApplicationController
  def index
    matching_tbrs = Tbr.all

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
      redirect_to("/", { :notice => "Tbr created successfully." })
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
      redirect_to("/tbrs/#{the_tbr.id}", { :notice => "Tbr updated successfully."} )
    else
      redirect_to("/tbrs/#{the_tbr.id}", { :alert => the_tbr.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_tbr = Tbr.where({ :id => the_id }).at(0)

    the_tbr.destroy

    redirect_to("/", { :notice => "Tbr deleted successfully."} )
  end
end
