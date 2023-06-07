# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'
require 'json'

# Define the number of movies you want to seed
num_movies = 15

# Define your API key
# api_key = '12714b6e25147a7fe7fe0a3a0fd804a9'

# Set up the URL with the API key
url = "https://api.themoviedb.org/3/movie/top_rated?api_key=12714b6e25147a7fe7fe0a3a0fd804a9"

# Read the JSON response from the API
response = URI.open(url).read

# Parse the JSON response
movies = JSON.parse(response)['results'].first(num_movies)

# Seed the movie data in your database
movies.each do |movie_data|
  Movie.create(
    title: movie_data['title'],
    overview: movie_data['overview'],
    poster_url: "https://image.tmdb.org/t/p/original#{movie_data['poster_path']}",
    rating: movie_data['vote_average']
  )
end
