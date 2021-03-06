require_relative '../queries/person_queries'
require_relative '../queries/movie_queries'
require_relative '../queries/tv_show_queries'
require_relative '../../models/tv_show'
require_relative '../../models/movie'
require_relative '../../models/person'

module Types
    class QueryType < Types::BaseObject
        include MovieQueries
        include TvShowQueries
        include PersonQueries

        field :movie_by_id, Movie::GraphQLType, null: false, description: "Get movie details by movie id" do
            argument :id, Integer, required: true
        end 
        field :popular_movies, [Movie::GraphQLType], null: false, description: "Get list of popular movies"
        field :top_rated_movies, [Movie::GraphQLType], null: false, description: "Get list of top rated movies"
        field :upcoming_movies, [Movie::GraphQLType], null: false, description: "Get list of upcoming movies"
        field :now_playing_movies, [Movie::GraphQLType], null: false, description: "Get list movies in theatres"

        field :tv_show_by_id, TvShow::GraphQLType, null: false, description: "Get tv show details by tv show id" do
            argument :id, Integer, required: true
        end 
        field :popular_tv_shows, [TvShow::GraphQLType], null: false, description: "Get list of popular tv shows"
        field :top_rated_tv_shows, [TvShow::GraphQLType], null: false, description: "Get list of top rated tv shows"
        field :on_air_tv_shows, [TvShow::GraphQLType], null: false, description: "Get list of tv shows on air in last 7 days"

        field :person_by_id, Person::GraphQLType, null: false, description: "Get person details by person id" do
            argument :id, Integer, required: true
        end 
    end
end
