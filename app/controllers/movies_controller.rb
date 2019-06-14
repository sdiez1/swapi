class MoviesController < ApplicationController
  def index
  	response = @@client.query <<~GRAPHQL
      query {
        allFilms {
		    edges {
		      node {
		        id
		        title
		        releaseDate
		        director
		        producers
		        episodeID
		      }
		    }
		  }
      }
    GRAPHQL

    @movies = response.data.all_films.edges
  end

  def show
  	response = @@client.query <<~GRAPHQL
      query {
          film(id: "#{params[:id]}") {
		    id
		    title
		    episodeID
		    openingCrawl
		    director
		    producers
		    releaseDate
		    characterConnection {
		      edges {
		        node {
		          ...CharacterFragment
		        }
		      }
		    }
		    starshipConnection {
		      edges {
		        node {
		          ...StarshipFragment
		        }
		      }
		    }
		    planetConnection {
		      edges {
		        node {
		          ...PlanetFragment
		        }
		      }
		    }
		  }
		}

		fragment StarshipFragment on Starship {
		  id
		  name
		}

		fragment CharacterFragment on Person {
		  id
		  name
		}

		fragment PlanetFragment on Planet {
		  id
		  name
		}
    GRAPHQL

    @movie = response.data.film


  end
end
