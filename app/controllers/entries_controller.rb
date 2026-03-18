def create
  if session["user_id"] == nil
    redirect_to "/login"
    return
  end

  @entry = Entry.new
  @entry["title"] = params["title"]
  @entry["description"] = params["description"]
  @entry["occurred_on"] = params["occurred_on"]
  @entry["place_id"] = params["place_id"]
  @entry["user_id"] = session["user_id"]

  if params["image"]
    @entry.image.attach(params["image"])
  end

  @entry.save

  redirect_to "/places/#{@entry["place_id"]}"
end
