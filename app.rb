require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/places")

get("/") do
  @places = Places.all()
  erb(:index)
end

post("/places") do
  description = params.fetch("description")
  place = Places.new(description)
  place.save()
  erb(:success)
end

post("/clear") do
  Places.clear()
  erb(:success)
end
