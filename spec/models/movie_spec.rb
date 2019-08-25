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
  let(:admin) {
    User.create(
      :username => "Walt",
      :email => "walt@gmail.com",
      :password => "password",
      :admin => true
    )
  }
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
  #
  let(:comedy) {
    Genre.create(
      :name => "Comedy"
    )
  }

  let(:easy_a) {
    Movie.create(
      :title => "Easy A",
      :synopsis => "After a little white lie about losing her virginity gets out, a clean cut high school girl sees her life paralleling Hester Prynne's in 'The Scarlet Letter,' which she is currently studying in school - until she decides to use the rumor mill to advance her social and financial standing.",
      :year => 2010,
      :user_id => admin.id,
      :genre_id => comedy.id
    )
  }

  # let(:first_review) {
  #   Review.create(
  #     :user_id => admin.id,
  #     :movie_id => easy_a.id,
  #     :title => "Great Movie!",
  #     :content => "Easy A is a great movie. Emma Stone steals the show.",
  #     :rating => 4
  #   )
  # }
  #
  # let(:second_review) {
  #   Review.create(
  #     :user_id => user.id,
  #     :movie_id => easy_a.id,
  #     :title => "Best Movie Ever!!!",
  #     :content => "Easy A is the best movie of all time. I will always love Amanda Bynes.",
  #     :rating => 5
  #   )
  # }

  it "is valid with a title, synopsis, and year" do
    expect(easy_a).to be_valid
  end

  # it "is not valid without a title" do
  #   expect(Movie.new(:synopsis => "Movie synopsis", :year => 2000, :genre_id => comedy.id)).to_not be_valid
  # end
  it { should validate_presence_of(:title) }

  # it "is not valid without a synopsis" do
  #   expect(Movie.new(:title => "Movie Title", :year => 2000, :genre_id => comedy.id)).to_not be_valid
  # end
  it { should validate_presence_of(:synopsis) }

  # it "is not valid without a year" do
  #   expect(Movie.new(:title => "Movie Title", :synopsis => "Movie synopsis", :genre_id => comedy.id)).to_not be_valid
  # end
  it { should validate_presence_of(:year) }

  # it "has many movie_actors" do
  #   emma_easy_a = MovieActor.create(:movie_id => easy_a.id, :actor_id => emma_stone.id)
  #   penn_easy_a = MovieActor.create(:movie_id => easy_a.id, :actor_id => penn_badgley.id)
  #   expect(easy_a.movie_actors).to include(emma_easy_a)
  #   expect(easy_a.movie_actors).to include(penn_easy_a)
  # end
  it { should have_many(:movie_actors) }

  # it "has many actors through movie_actors" do
  #   MovieActor.create(:movie_id => easy_a.id, :actor_id => emma_stone.id)
  #   MovieActor.create(:movie_id => easy_a.id, :actor_id => penn_badgley.id)
  #   expect(easy_a.actors).to include(emma_stone)
  #   expect(easy_a.actors).to include(penn_badgley)
  # end
  it { should have_many(:actors).through(:movie_actors) }

  # it "has many reviews" do
  #   expect(easy_a.reviews).to include(first_review)
  #   expect(easy_a.reviews).to include(second_review)
  # end
  it { should have_many(:reviews) }

  # it "has many users through reviews" do
  #   first_review = Review.create(
  #     :user_id => admin.id,
  #     :movie_id => easy_a.id,
  #     :title => "Great Movie!",
  #     :content => "Easy A is a great movie. Emma Stone steals the show.",
  #     :rating => 4
  #   )
  #
  #   second_review = Review.create(
  #     :user_id => user.id,
  #     :movie_id => easy_a.id,
  #     :title => "Best Movie Ever!!!",
  #     :content => "Easy A is the best movie of all time. I will always love Amanda Bynes.",
  #     :rating => 5
  #   )
  #   expect(easy_a.users).to include(user)
  #   expect(easy_a.users).to include(admin)
  # end
  it { should have_many(:users).through(:reviews) }

end
