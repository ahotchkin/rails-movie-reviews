require 'rails_helper'

RSpec.describe Actor, :type => :model do
  let(:emma_stone) {
    Actor.create(
      :first_name => "Emma",
      :last_name => "Stone",
    )
  }

  # let(:easy_a) {
  #   Movie.create(
  #     :title => "Easy A",
  #     :synopsis => "After a little white lie about losing her virginity gets out, a clean cut high school girl sees her life paralleling Hester Prynne's in 'The Scarlet Letter,' which she is currently studying in school - until she decides to use the rumor mill to advance her social and financial standing.",
  #     :year => 2010,
  #   )
  # }
  #
  # let(:la_la_land) {
  #   Movie.create(
  #     :title => "La La Land",
  #     :synopsis => "Aspiring actress serves lattes to movie stars in between auditions and jazz musician Sebastian scrapes by playing cocktail-party gigs in dingy bars. But as success mounts, they are faced with decisions that fray the fragile fabric of their love affair, and the dreams they worked so hard to maintain in each other threaten to rip them apart.",
  #     :year => 2016,
  #   )
  # }

  it "is valid with a first name and last name" do
    expect(emma_stone).to be_valid
  end

  # it "is not valid without a first name" do
  #   expect(Actor.new(:last_name => "last")).to_not be_valid
  # end
  it { should validate_presence_of(:first_name) }

  # it "is valid without a last name" do
  #   expect(Actor.new(:first_name => "Cher")).to be_valid
  # end

  # it "has many movie_actors" do
  #   emma_easy_a = MovieActor.create(:movie_id => easy_a.id, :actor_id => emma_stone.id)
  #   emma_la_la_land = MovieActor.create(:movie_id => la_la_land.id, :actor_id => emma_stone.id)
  #   expect(emma_stone.movie_actors).to include(emma_easy_a)
  #   expect(emma_stone.movie_actors).to include(emma_la_la_land)
  # end
  it { should have_many(:movie_actors) }

  # it "has many movies through movie_actors" do
  #   MovieActor.create(:movie_id => easy_a.id, :actor_id => emma_stone.id)
  #   MovieActor.create(:movie_id => la_la_land.id, :actor_id => emma_stone.id)
  #   expect(emma_stone.movies).to include(easy_a)
  #   expect(emma_stone.movies).to include(la_la_land)
  # end
  it { should have_many(:movies).through(:movie_actors) }

end
