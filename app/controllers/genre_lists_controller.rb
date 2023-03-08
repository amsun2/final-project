class GenreListsController < ApplicationController
  def index
    matching_genre_lists = GenreList.all

    @list_of_genre_lists = matching_genre_lists.order({ :genre_name => :asc })

    render({ :template => "genre_lists/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_genre_lists = GenreList.where({ :id => the_id })

    @the_genre_list = matching_genre_lists.at(0)

    render({ :template => "genre_lists/show.html.erb" })
  end

  def create
    the_genre_list = GenreList.new
    the_genre_list.genre_name = params.fetch("query_genre_name")

    if the_genre_list.valid?
      the_genre_list.save
      redirect_to("/genre_lists", { :notice => "Genre created successfully." })
    else
      redirect_to("/genre_lists", { :alert => the_genre_list.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_genre_list = GenreList.where({ :id => the_id }).at(0)

    the_genre_list.genre_name = params.fetch("query_genre_name")

    if the_genre_list.valid?
      the_genre_list.save
      redirect_to("/genre_lists/#{the_genre_list.id}", { :notice => "Genre list updated successfully."} )
    else
      redirect_to("/genre_lists/#{the_genre_list.id}", { :alert => the_genre_list.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_genre_list = GenreList.where({ :id => the_id }).at(0)

    the_genre_list.destroy

    redirect_to("/genre_lists", { :notice => "Genre deleted successfully."} )
  end
end
