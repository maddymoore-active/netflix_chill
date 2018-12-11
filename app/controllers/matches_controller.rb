class MatchesController < ApplicationController
  def index
    @matches = Match.all

    render("match_templates/index.html.erb")
  end

  def show
    @match = Match.find(params.fetch("id_to_display"))

    render("match_templates/show.html.erb")
  end

  def new_form
    @match = Match.new

    render("match_templates/new_form.html.erb")
  end

  def create_row
    @match = Match.new

    @match.user_id = params.fetch("user_id")
    @match.other_id = params.fetch("other_id")

    if @match.valid?
      @match.save

      redirect_back(:fallback_location => "/matches", :notice => "Match created successfully.")
    else
      render("match_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @match = Match.find(params.fetch("prefill_with_id"))

    render("match_templates/edit_form.html.erb")
  end

  def update_row
    @match = Match.find(params.fetch("id_to_modify"))

    @match.user_id = params.fetch("user_id")
    @match.other_id = params.fetch("other_id")

    if @match.valid?
      @match.save

      redirect_to("/matches/#{@match.id}", :notice => "Match updated successfully.")
    else
      render("match_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_other
    @match = Match.find(params.fetch("id_to_remove"))

    @match.destroy

    redirect_to("/users/#{@match.other_id}", notice: "Match deleted successfully.")
  end

  def destroy_row_from_user
    @match = Match.find(params.fetch("id_to_remove"))

    @match.destroy

    redirect_to("/users/#{@match.user_id}", notice: "Match deleted successfully.")
  end

  def destroy_row
    @match = Match.find(params.fetch("id_to_remove"))

    @match.destroy

    redirect_to("/matches", :notice => "Match deleted successfully.")
  end
end
