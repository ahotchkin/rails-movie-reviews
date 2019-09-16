require 'rails_helper'


RSpec.describe Actor, :type => :model do

  describe "validations" do
    it { should validate_presence_of(:first_name) }
  end

  describe "associations" do
    it { should have_many(:movie_actors) }
    it { should have_many(:movies).through(:movie_actors) }
  end

  it "has an instance method 'full_name' that combines the actor's first_name and last_name" do
    emma_stone = Actor.create(:first_name => "Emma", :last_name => "Stone")
    expect(emma_stone.full_name).to eq("Emma Stone")
  end

end
