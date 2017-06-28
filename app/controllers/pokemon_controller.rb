# require 'typhoeus'

class PokemonController < ActionController::Base


  def show

    # Pasted from assignment:

    res = Typhoeus.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}/", followlocation: true)
    search_results = JSON.parse(res.body)
    # body["name"] # should be "pikachu"

    # Pasted from assignment:

    Typhoeus.get("https://api.giphy.com/v1/gifs/search?api_key=#{ENV["GIPHY_POKEGIFS_KEY"]}&q=#{params[:id]}&rating=g", followlocation: true)
    #---------------------- Giphy key is saved in my .bash_profile as GIPHY_POKEGIFS_KEY

    render json: {
      'name' => search_results["name"],
      'types' => search_results["types"]
    }



  end#def
end#class
