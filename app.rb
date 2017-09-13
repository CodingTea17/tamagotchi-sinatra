require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/tamagotchi')
require('pry')

get('/') do
  # @stats = Tamagotchi.all()
  erb(:tamagotchi)
end

post('/new_pet') do
  name = params["name"]
  # if !Item.check_dup_name(name) and !Item.check_dup_rank(rank)
  #   item = Item.new(name,rank)
  #   item.save()
  # else
  #   @duplicate_error = "thing"
  # end
  # @list = Item.sort
  pet = Tamagotchi.new(name)
  @stats = Tamagotchi.all()
  erb(:update)
end

get('/:name') do
  Tamagotchi.food_level
  @stats = Tamagotchi.all()
  erb(:pet_stats)
end
