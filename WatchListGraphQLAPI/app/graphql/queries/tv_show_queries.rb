require "http"
require_relative "../../models/tv_show"
require_relative "../../models/serializers"

module TvShowQueries 
    @@API_KEY = 'da4c6ba6f06724d02816bdcefb12c87b'

    def popular_tv_shows()
        url = "https://api.themoviedb.org/3/tv/popular?api_key=#@@API_KEY&language=en-US"
        response = HTTP.get(url)
        return Serializers.serialize_json_array_to_type(response, TvShow)
    end

    def top_rated_tv_shows()
        url = "https://api.themoviedb.org/3/tv/top_rated?api_key=#@@API_KEY&language=en-US"
        response = HTTP.get(url)
        return Serializers.serialize_json_array_to_type(response, TvShow)
    end

    def on_air_tv_shows()
        url = "https://api.themoviedb.org/3/tv/on_the_air?api_key=#@@API_KEY&language=en-US"
        response = HTTP.get(url)
        return Serializers.serialize_json_array_to_type(response, TvShow)
    end
end