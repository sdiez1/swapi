class CharactersController < ApplicationController
  def show
    response = @@client.query <<~GRAPHQL
      query {
        person(id: "#{params[:id]}") {
        id
        name
        birthYear
        eyeColor
        gender
        height
        hairColor
        mass
        skinColor
        homeworld {
          id
          name
        }
        starshipConnection {
          edges {
            node {
              ...StarshipFragment
            }
          }
        }
        filmConnection {
          edges {
            node {
              ...FilmFragment
            }
          }
        }
      }
    }


    fragment FilmFragment on Film {
      id
      title
    }

    fragment StarshipFragment on Starship {
      id
      name
      costInCredits
      model
    }
    GRAPHQL

    @character = response.data.person
  end
end
