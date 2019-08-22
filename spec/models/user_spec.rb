require 'rails_helper'

RSpec.describe User, :type => :model do
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
      :genre_id => comedy.id
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

  let(:easy_a_review) {
    Review.create(
      :user_id => user.id,
      :movie_id => easy_a.id,
      :content => "Easy A is a great movie. Emma Stone steals the show.",
      :rating => 4
    )
  }

  let(:superstar_review) {
    Review.create(
      :user_id => user.id,
      :movie_id => superstar.id,
      :content => "Superstar is hilarious at every turn.",
      :rating => 4
    )
  }

  it "is valid with a username, email, and password" do
    expect(user).to be_valid
  end

  it "is not valid without a username" do
    expect(User.new(:email => "user@gmail.com", :password => "password")).to_not be_valid
  end

  it "is not valid without an email" do
    expect(User.new(:username => "Name", :password => "password")).to_not be_valid
  end

  it "is not valid without a password" do
    expect(User.new(:username => "Name", :email => "user@gmail.com")).to_not be_valid
  end

  it "is valid with an admin boolean" do
    expect(admin).to be_valid
  end

  it "defaults to admin => false" do
    expect(user.admin).to eq(false)
  end

  it "has many reviews" do
    expect(user.reviews.first).to eq(easy_a_review)
    expect(user.reviews.last).to eq(superstar_review)
  end

  it "has many movies through reviews" do
    # is this the right way to write this test???
    # user.movies << [easy_a, superstar]
    expect(user.movies.first).to eq(easy_a)
    expect(user.movies.last).to eq(superstar)
  end

end
