require 'rails_helper'

RSpec.describe Movie, :type => :model do

  # let(:user) {
  #   User.create(
  #     :username => "Mindy",
  #     :email => "mindy@gmail.com",
  #     :password => "password",
  #   )
  # }
  #
  # let(:admin) {
  #   User.create(
  #     :username => "Walt",
  #     :email => "walt@gmail.com",
  #     :password => "password",
  #     :admin => true
  #   )
  # }
  #
  # let(:emma_stone) {
  #   Actor.create(
  #     :first_name => "Emma",
  #     :last_name => "Stone",
  #   )
  # }
  #
  # let(:penn_badgley) {
  #   Actor.create(
  #     :first_name => "Penn",
  #     :last_name => "Badgley",
  #   )
  # }

  let(:comedy) {
    Genre.create(
      :name => "Comedy"
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

  it "is valid with a title, summary, and year" do
    expect(easy_a).to be_valid
  end

  it "is not valid without a title" do
    expect(Movie.new(:summary => "Movie summary", :year => 2000, :genre_id => comedy.id)).to_not be_valid
  end

  it "is not valid without a summary" do
    expect(Movie.new(:title => "Movie Title", :year => 2000, :genre_id => comedy.id)).to_not be_valid
  end

  it "is not valid without a year" do
    expect(Movie.new(:title => "Movie Title", :summary => "Movie summary", :genre_id => comedy.id)).to_not be_valid
  end

  it { should have_many(:movie_actors) }

  # it "has many movie_actors" do
  #   emma_easy_a = MovieActor.create(:movie_id => easy_a.id, :actor_id => emma_stone.id)
  #   penn_easy_a = MovieActor.create(:movie_id => easy_a.id, :actor_id => penn_badgley.id)
  #   expect(easy_a.movie_actors.first).to eq(emma_easy_a)
  #   expect(easy_a.movie_actors.last).to eq(penn_easy_a)
  # end

  it { should have_many(:actors).through(:movie_actors) }

  # it "has many actors through movie_actors" do
  #   # is this the right way to write this test???
  #   easy_a.actors << [emma_stone, penn_badgley]
  #   expect(easy_a.actors.first).to eq(emma_stone)
  #   expect(easy_a.actors.last).to eq(penn_badgley)
  # end

  it { should have_many(:reviews) }

  # it "has many reviews" do
  #   first_review = Review.create(:user_id => user.id, :movie_id => easy_a.id, :content => "Easy A is a great movie. Emma Stone steals the show.", :rating => 4)
  #   second_review = Review.create(:user_id => admin.id, :movie_id => easy_a.id, :content => "Easy A is the best movie of all time. I will always love Amanda Bynes.", :rating => 5)
  #   expect(easy_a.reviews.first).to eq(first_review)
  #   expect(easy_a.reviews.last).to eq(second_review)
  # end

  it { should have_many(:users).through(:reviews) }

  # it "has many users through reviews" do
  #   # is this the right way to write this test???
  #   easy_a.users << [user, admin]
  #   expect(easy_a.users.first).to eq(user)
  #   expect(easy_a.users.last).to eq(admin)
  # end

end
