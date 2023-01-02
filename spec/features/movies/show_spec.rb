# When I visit a movie's show page.
# I see the movie's title, creation year, and genre,
# and a list of all its actors from youngest to oldest.
# And I see the average age of all of the movie's actors

require 'rails_helper'

RSpec.describe "Movies Show Page" do
  describe "User Story 2" do
    it 'has the movie info' do
      visit "/movies/#{@movie_1.id}"

      expect(page).to have_content(@movie_1.title)
      expect(page).to have_content(@movie_1.creation_year)
      expect(page).to have_content(@movie_1.genre)
    end

    it 'lists all the actors from youngest to oldest' do
      visit "/movies/#{@movie_1.id}"

      expect(@actor_2.name).to appear_before(@actor_1.name)
    end

    it 'has the average age of actors' do
      visit "/movies/#{@movie_1.id}"

      expect(page).to have_content(@movie_1.actors.average_age)
    end
  end
end