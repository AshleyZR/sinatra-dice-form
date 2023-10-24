require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end

get("/dice/:number_of_dice/:how_many_sides") do
  @num_dice = params["number_of_dice"].to_i
  @rolls = []
  @sides = params["how_many_sides"].to_i

  @num_dice.times do
    die = rand(1..@sides)

    @rolls.push(die)
  end

  erb(:flexible)
end


get ("/process_roll") do
  number_of_dice = params["dice"].to_i
  how_many_sides = params["sides"].to_i

  # citation: redirect to function helped by chatgpt
  redirect to("/dice/#{number_of_dice}/#{how_many_sides}")
end
