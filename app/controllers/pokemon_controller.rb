# require 'typhoeus'

class PokemonController < ActionController::Base

  # Pasted from assignment:
  
  res = Typhoeus.get("http://pokeapi.co/api/v2/pokemon/pikachu/", followlocation: true)
  body = JSON.parse(res.body)
  body["name"] # should be "pikachu"

end
