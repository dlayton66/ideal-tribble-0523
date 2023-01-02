# As a user,
# When I visit a movie show page,
# I do not see any actors listed that are not part of the movie
# And I see a form to add an actor to this movie
# When I fill in the form with the ID of an actor that exists in the database
# And I click submit
# Then I am redirected back to that movie's show page
# And I see the actor's name is now listed
# (You do not have to test for a sad path, for example if the id submitted is not an existing actor)

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

  describe "User Story 3" do
    it 'only shows actors currently associated with that movie' do
      visit "/movies/#{@movie_1.id}"

      expect(page).to_not have_content(@actor_4.name)
    end

    it 'has a form to add existing actor to movie by id' do
      visit "/movies/#{@movie_1.id}"

      expect(page).to have_field(:actor_id)

      fill_in(:actor_id, with: @actor_4.id)
      click_button("Submit")

      expect(current_path).to eq("/movies/#{@movie_1.id}")

      expect(page).to have_content(@actor_4.name)
    end
  end
end