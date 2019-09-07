require 'rails_helper'

RSpec.describe Movie, :type => :model do

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:synopsis) }
    it { should validate_presence_of(:year) }
  end

  describe "associations" do
    it { should have_many(:movie_genres) }
    it { should have_many(:genres).through(:movie_genres) }
    it { should have_many(:movie_actors) }
    it { should have_many(:actors).through(:movie_actors) }
    it { should have_many(:reviews) }
    it { should have_many(:users).through(:reviews) }
  end

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
  #
  # let(:comedy) {
  #   Genre.create(
  #     :name => "Comedy"
  #   )
  # }
  #
  # let(:drama) {
  #   Genre.create(
  #     :name => "Drama"
  #   )
  # }

  # let(:easy_a) {
  #   Movie.create(
  #     :title => "Easy A",
  #     :synopsis => "After a little white lie about losing her virginity gets out, a clean cut high school girl sees her life paralleling Hester Prynne's in 'The Scarlet Letter,' which she is currently studying in school - until she decides to use the rumor mill to advance her social and financial standing.",
  #     :year => 2010,
  #     :user_id => admin.id,
  #   )
  # }

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

  # it "is valid with a title, synopsis, and year" do
  #   expect(easy_a).to be_valid
  # end
end
