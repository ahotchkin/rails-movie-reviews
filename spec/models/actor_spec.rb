require 'rails_helper'
#

# => actor needs: and many movies through movie_actors
#
RSpec.describe Actor, :type => :model do
  let(:emma_stone) {
    Actor.create(
      :first_name => "Emma",
      :last_name => "Stone",
    )
  }

  let(:comedy) {
    Genre.create(
      :name => "Comedy"
    )
  }

  let(:musical) {
    Genre.create(
      :name => "Musical"
    )
  }

  let(:easy_a) {
    Movie.create(
      :title => "Easy A",
      :summary => "After a little white lie about losing her virginity gets out, a clean cut high school girl sees her life paralleling Hester Prynne's in 'The Scarlet Letter,' which she is currently studying in school - until she decides to use the rumor mill to advance her social and financial standing.",
      :year => 2010,
      :genre_id => comedy.id
    )
  }

  let(:la_la_land) {
    Movie.create(
      :title => "La La Land",
      :summary => "Aspiring actress serves lattes to movie stars in between auditions and jazz musician Sebastian scrapes by playing cocktail-party gigs in dingy bars. But as success mounts, they are faced with decisions that fray the fragile fabric of their love affair, and the dreams they worked so hard to maintain in each other threaten to rip them apart.",
      :year => 2016,
      :genre_id => musical.id
    )
  }

  let(:superstar) {
    Movie.create(
      :title => "Superstar",
      :summary => "Orphan Mary Katherine Gallagher, an ugly duckling at St. Monica High School, has a dream: to be kissed soulfully. She decides she can realize this dream if she becomes a superstar, so her prayers, her fantasies, and her conversations with her only friend focus on achieving super-stardom. Her big chance is a school talent contest; her main competition is Evian, the school beauty, who is dancing with Sky, the object of Mary Katherine's kiss dream. Mary Katherine gets some talent-show help from her fellow special education students, her grandma, and Jesus, and inspiration from secrets in her past. Watching are Sky, Evian, and a silent classmate.",
      :year => 1999,
      :genre_id => comedy.id
    )
  }

  it "is valid with a first name and last name" do
    expect(emma_stone).to be_valid
  end

  it "is not valid without a first name" do
    expect(Actor.new(:last_name => "last")).not_to be_valid
  end

  it "is valid without a last name" do
    expect(Actor.new(:first_name => "Cher")).to be_valid
  end

  it "has many movie_actors" do
    emma_easy_a = MovieActor.create(:movie_id => easy_a.id, :actor_id => emma_stone.id)
    emma_la_la_land = MovieActor.create(:movie_id => la_la_land.id, :actor_id => emma_stone.id)
    expect(emma_stone.movie_actors.first).to eq(emma_easy_a)
    expect(emma_stone.movie_actors.last).to eq(emma_la_la_land)
  end

  it "has many movies through movie_actors" do
    emma_stone.movies << [easy_a, la_la_land]
    expect(emma_stone.movies.first).to eq(easy_a)
    expect(emma_stone.movies.last).to eq(la_la_land)
  end

end
