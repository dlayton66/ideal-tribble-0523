# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

MovieActor.destroy_all
Movie.destroy_all
Actor.destroy_all
Studio.destroy_all

@studio_1 = Studio.create!(name: "Warner Bros", location: "Hollywood")
@studio_2 = Studio.create!(name: "Universal", location: "Hollywood")

@movie_1 = @studio_1.movies.create!(title: "The Master", creation_year: "2012", genre: "Drama")
@movie_2 = @studio_2.movies.create!(title: "Punch-Drunk Love", creation_year: "2002", genre: "Comedy")

@actor_1 = @movie_1.actors.create!(name: "Joaquin Phoenix", age: 48)
@actor_2 = @movie_1.actors.create!(name: "Philip Seymour Hoffman", age: 46)
@actor_3 = @movie_2.actors.create!(name: "Adam Sandler", age: 56)