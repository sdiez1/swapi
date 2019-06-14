class StarshipsController < ApplicationController
	def show
    response = @@client.query <<~GRAPHQL
      query {
		  starship(id: "#{params[:id]}") {
		    id
		    name
		    model
		    manufacturers
		    costInCredits
		    length
		    maxAtmospheringSpeed
		    crew
		    passengers
		    cargoCapacity
		    consumables
		    hyperdriveRating
		    MGLT
		    starshipClass
		    filmConnection {
		      edges {
		        node {
		          ...FilmFragment
		        }
		      }
		    }
		    pilotConnection {
		      edges {
		        node {
		          ...PilotFragment
		        }
		      }
		    }
		  }
		}

		fragment FilmFragment on Film {
		  id
		  title
		}

		fragment PilotFragment on Person {
		  id
		  name
		}
    GRAPHQL

    @starship = response.data.starship
  end
end
