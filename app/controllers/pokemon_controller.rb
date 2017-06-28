# require 'typhoeus'

class PokemonController < ActionController::Base


  def show

    # Pasted from assignment:

    find_pokemons = Typhoeus.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}/", followlocation: true)
    pokemon_search_results = JSON.parse(find_pokemons.body)
    # body["name"] # should be "pikachu"

    # Pasted from assignment:

    find_gifs = Typhoeus.get("https://api.giphy.com/v1/gifs/search?api_key=#{ENV["GIPHY_POKEGIFS_KEY"]}&q=#{params[:id]}&rating=g", followlocation: true)
    #---------------------- Giphy key is saved in my .bash_profile as GIPHY_POKEGIFS_KEY
    gif_search_results = JSON.parse(find_gifs.body)


    render json: {
      'name' => pokemon_search_results["name"],
      'types' => pokemon_search_results["types"].first["type"]["name"],
      'gifs' => gif_search_results["data"].first["bitly_gif_url"]
    }

  end#def
end#class
