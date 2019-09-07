require 'rails_helper'

RSpec.describe Movie, :type => :model do

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:synopsis) }
    it { should validate_presence_of(:year) }
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:movie_genres) }
    it { should have_many(:genres).through(:movie_genres) }
    it { should have_many(:movie_actors) }
    it { should have_many(:actors).through(:movie_actors) }
    it { should have_many(:reviews) }
    it { should have_many(:users).through(:reviews) }
  end
  
end
