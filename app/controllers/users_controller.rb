class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@users.where.not(:location_latitude => nil)) do |user, marker|
      marker.lat user.location_latitude
      marker.lng user.location_longitude
      marker.infowindow "<h5><a href='/users/#{user.id}'>#{user.created_at}</a></h5><small>#{user.location_formatted_address}</small>"
    end

    render("user_templates/index.html.erb")
  end

  def show
    @user = User.find(params.fetch("id_to_display"))

    render("user_templates/show.html.erb")
  end
end
