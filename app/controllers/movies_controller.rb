class MoviesController < ApplicationController
  def index
    @q = Movie.ransack(params[:q])
    @movies = @q.result(:distinct => true).includes(:likes).page(params[:page]).per(10)

    render("movie_templates/index.html.erb")
  end

  def show
    @like = Like.new
    @movie = Movie.find(params.fetch("id_to_display"))

    render("movie_templates/show.html.erb")
  end

  def new_form
    @movie = Movie.new

    render("movie_templates/new_form.html.erb")
  end

  def create_row
    @movie = Movie.new

    @movie.title = params.fetch("title")
    @movie.image = params.fetch("image") if params.key?("image")

    if @movie.valid?
      @movie.save

      redirect_back(:fallback_location => "/movies", :notice => "Movie created successfully.")
    else
      render("movie_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @movie = Movie.find(params.fetch("prefill_with_id"))

    render("movie_templates/edit_form.html.erb")
  end

  def update_row
    @movie = Movie.find(params.fetch("id_to_modify"))

    @movie.title = params.fetch("title")
    @movie.image = params.fetch("image") if params.key?("image")

    if @movie.valid?
      @movie.save

      redirect_to("/movies/#{@movie.id}", :notice => "Movie updated successfully.")
    else
      render("movie_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @movie = Movie.find(params.fetch("id_to_remove"))

    @movie.destroy

    redirect_to("/movies", :notice => "Movie deleted successfully.")
  end
end
