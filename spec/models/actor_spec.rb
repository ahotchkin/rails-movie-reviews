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

  it "has a class method 'sorted_actors' that sorts by last name, if present, and first name if last name is blank" do
    emma_stone = Actor.create(:first_name => "Emma", :last_name => "Stone")
    penn_badgley = Actor.create(:first_name => "Penn", :last_name => "Badgley")
    cher = Actor.create(:first_name => "Cher", :last_name => "")
    expect(Actor.sorted_actors).to eq([penn_badgley, cher, emma_stone])
  end

end
