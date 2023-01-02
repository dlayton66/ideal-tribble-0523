require 'rails_helper'

RSpec.describe Actor do
  describe 'relationships' do
    it { should have_many :movie_actors }
    it { should have_many(:movies).through(:movie_actors) }
  end

  describe '#average_age' do
    it 'returns the average age of all the actors' do
      expect(Actor.average_age).to eq 49.5
    end
  end
end