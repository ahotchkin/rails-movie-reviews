require 'rails_helper'

RSpec.describe Review, :type => :model do
  let(:user) {
    User.create(
      :username => "Mindy",
      :email => "mindy@gmail.com",
      :password => "password",
    )
  }

  let(:admin) {
    User.create(
      :username => "Walt",
      :email => "walt@gmail.com",
      :password => "password",
      :admin => true
    )
  }

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
      :user_id => admin.id,
      :genre_id => comedy.id
    )
  }

  let(:easy_a_review) {
    Review.create(
      :user_id => user.id,
      :movie_id => easy_a.id,
      :title => "Great Movie!",
      :content => "Easy A is a great movie. Emma Stone steals the show.",
      :rating => 4
    )
  }

  it "is valid with a title, content, and rating" do
    expect(easy_a_review).to be_valid
  end

  # it "is not valid without a title" do
  #   expect(Review.new(:user_id => user.id, :movie_id => easy_a.id, :content => "Easy A is a great movie. Emma Stone steals the show.", :rating => 4)).to_not be_valid
  # end
  it { should validate_presence_of(:title) }

  # it "is not valid without content" do
  #   expect(Review.new(:user_id => user.id, :movie_id => easy_a.id, :title => "Great Movie!", :rating => 4)).to_not be_valid
  # end
  it { should validate_presence_of(:content) }

  # it "is not valid without a rating" do
  #   expect(Review.new(:user_id => user.id, :movie_id => easy_a.id, :title => "Great Movie!", :content => "Easy A is a great movie. Emma Stone steals the show.")).to_not be_valid
  # end
  it { should validate_presence_of(:rating) }


end
