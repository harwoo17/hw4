class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })

    if session["user_id"]
      @entries = Entry.where({
        "place_id" => @place["id"],
        "user_id" => session["user_id"]
      })
    else
      @entries = []
    end
  end

  def new
    if session["user_id"] == nil
      redirect_to "/login"
      return
    end
  end

  def create
    if session["user_id"] == nil
      redirect_to "/login"
      return
    end

    @place = Place.new
    @place["name"] = params["name"]
    @place.save
    redirect_to "/places"
  end
end
