# As a user,
# When I visit the studio index page,
# Then I see all of the studios including name and location,
# And under each studio I see all of the studio's movies
# including the movie's title, creation year, and genre

require 'rails_helper'

RSpec.describe "Studios Index Page" do
  describe 'User Story 1' do
    it 'shows all studio info' do
      visit studios_path

      expect(page).to have_content(@studio_1.name)
      expect(page).to have_content(@studio_1.location)
      expect(page).to have_content(@studio_2.name)
      expect(page).to have_content(@studio_2.location)
    end
  end
end