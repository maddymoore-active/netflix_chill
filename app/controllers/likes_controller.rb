class LikesController < ApplicationController
  before_action :current_user_must_be_like_user, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_like_user
    like = Like.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == like.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Like.ransack(params[:q])
    @likes = @q.result(:distinct => true).includes(:user, :show, :movie).page(params[:page]).per(10)

    render("like_templates/index.html.erb")
  end

  def show
    @like = Like.find(params.fetch("id_to_display"))

    render("like_templates/show.html.erb")
  end

  def new_form
    @like = Like.new

    render("like_templates/new_form.html.erb")
  end

  def create_row
    @like = Like.new

    @like.user_id = params.fetch("user_id")
    @like.movie_id = params.fetch("movie_id")
    @like.show_id = params.fetch("show_id")

    if @like.valid?
      @like.save

      redirect_back(:fallback_location => "/likes", :notice => "Like created successfully.")
    else
      render("like_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_show
    @like = Like.new

    @like.user_id = params.fetch("user_id")
    @like.movie_id = params.fetch("movie_id")
    @like.show_id = params.fetch("show_id")

    if @like.valid?
      @like.save

      redirect_to("/shows/#{@like.show_id}", notice: "Like created successfully.")
    else
      render("like_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_movie
    @like = Like.new

    @like.user_id = params.fetch("user_id")
    @like.movie_id = params.fetch("movie_id")
    @like.show_id = params.fetch("show_id")

    if @like.valid?
      @like.save

      redirect_to("/movies/#{@like.movie_id}", notice: "Like created successfully.")
    else
      render("like_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @like = Like.find(params.fetch("prefill_with_id"))

    render("like_templates/edit_form.html.erb")
  end

  def update_row
    @like = Like.find(params.fetch("id_to_modify"))

    
    @like.movie_id = params.fetch("movie_id")
    @like.show_id = params.fetch("show_id")

    if @like.valid?
      @like.save

      redirect_to("/likes/#{@like.id}", :notice => "Like updated successfully.")
    else
      render("like_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @like = Like.find(params.fetch("id_to_remove"))

    @like.destroy

    redirect_to("/users/#{@like.user_id}", notice: "Like deleted successfully.")
  end

  def destroy_row_from_show
    @like = Like.find(params.fetch("id_to_remove"))

    @like.destroy

    redirect_to("/shows/#{@like.show_id}", notice: "Like deleted successfully.")
  end

  def destroy_row_from_movie
    @like = Like.find(params.fetch("id_to_remove"))

    @like.destroy

    redirect_to("/movies/#{@like.movie_id}", notice: "Like deleted successfully.")
  end

  def destroy_row
    @like = Like.find(params.fetch("id_to_remove"))

    @like.destroy

    redirect_to("/likes", :notice => "Like deleted successfully.")
  end
end
