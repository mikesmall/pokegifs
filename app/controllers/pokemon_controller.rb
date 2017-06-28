# require 'typhoeus'

class PokemonController < ActionController::Base

  # Pasted from assignment:

  res = Typhoeus.get("http://pokeapi.co/api/v2/pokemon/pikachu/", followlocation: true)
  body = JSON.parse(res.body)
  body["name"] # should be "pikachu"

  # Pasted from assignment:

  Typhoeus.get("https://api.giphy.com/v1/gifs/search?api_key=#{ENV["GIPHY_POKEGIFS_KEY"]}&q=pikachu&rating=g", followlocation: true)

  #---------------------- Giphy key is saved in my .bash_profile as GIPHY_POKEGIFS_KEY

end
