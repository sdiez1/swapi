class PlanetsController < ApplicationController
	def show
    response = @@client.query <<~GRAPHQL
      query {
        planet(planetID: "1") {
	    id
	    name
	    rotationPeriod
	    orbitalPeriod
	    diameter
	    climates
	    gravity
	    terrains
	    surfaceWater
	    population

	    filmConnection {
	      edges {
	        node {
	          ...FilmFragment
	        }
	      }
	    }
	    
	    residentConnection {
	      edges {
	        node {
	          ...ResidentFragment
	        }
	      }
	    }
	  }
	}


	fragment FilmFragment on Film {
	  id
	  title
	}

	fragment ResidentFragment on Person {
	  id
	  name
	}
    GRAPHQL

    @planet = response.data.planet
  end
end
