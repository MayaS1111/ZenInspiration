require "sinatra"
require "sinatra/reloader"
require "http"

get("/") do
  erb(:home)
end

get("/quote") do
  api_url = "https://zenquotes.io/api/random" 
  raw_data = HTTP.get(api_url)
  raw_data_string = raw_data.to_s
  parsed_data = JSON.parse(raw_data_string)
  data = parsed_data.at(0)
  
  @quote = data.fetch("q")
  @author = data.fetch("a")
  erb(:quote)
end
