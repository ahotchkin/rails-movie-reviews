require 'rails_helper'

RSpec.describe MovieActor, :type => :model do

  describe "associations" do
    it { should belong_to(:movie) }
    it { should belong_to(:actor) }
  end

  it "has a class method 'find_movie_actor' that finds a movie_genre based on the movie and actor passed in" do
    admin = User.create(:username => "Walt", :email => "walt@gmail.com", :password => "password", :admin => true)
    comedy = Genre.create(:name => "Comedy")
    easy_a = Movie.create(
      :title => "Easy A",
      :synopsis => "After a little white lie about losing her virginity gets out, a clean cut high school girl sees her life paralleling Hester Prynne's in 'The Scarlet Letter,' which she is currently studying in school - until she decides to use the rumor mill to advance her social and financial standing.",
      :year => 2010,
      :user_id => admin.id
    )
    emma_stone = Actor.create(:first_name => "Emma", :last_name => "Stone")
    easy_a_emma = MovieActor.create(:movie_id => easy_a.id, :actor_id => emma_stone.id)
    expect(MovieActor.find_movie_actor(easy_a, emma_stone).first).to eq(easy_a_emma)
  end

end
