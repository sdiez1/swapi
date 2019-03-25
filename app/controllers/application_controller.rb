class ApplicationController < ActionController::Base
	def application
	  	@planets = self.class.get("/planets/")['results']
	    @starships = self.class.get("/starships/")['results']
	    @movies = self.class.get("/films/")['results']
	    @characters = self.class.get("/people/")['results']

	    @character = self.class.get("/people/#{params[:id]}")
	    @movie = self.class.get("/films/#{params[:id]}")
	    @starship = self.class.get("/starships/#{params[:id]}")
	    @planet = self.class.get("/planets/#{params[:id]}")
	    
	    @homeworld = self.class.get("/planets/#{@character["homeworld"].split("/")[5]}")
	    @id_homeworld = @character["homeworld"].split("/")[5]
	end
  
end
