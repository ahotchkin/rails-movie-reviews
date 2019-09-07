require 'rails_helper'

RSpec.describe MovieGenre, :type => :model do

  describe "associations" do
    it { should belong_to(:movie) }
    it { should belong_to(:genre) }
  end

  it "has a class method 'find_movie_genre' that finds a movie_genre based on the movie and genre passed in" do
    admin = User.create(:username => "Walt", :email => "walt@gmail.com", :password => "password", :admin => true)
    comedy = Genre.create(:name => "Comedy")
    easy_a = Movie.create(
      :title => "Easy A",
      :synopsis => "After a little white lie about losing her virginity gets out, a clean cut high school girl sees her life paralleling Hester Prynne's in 'The Scarlet Letter,' which she is currently studying in school - until she decides to use the rumor mill to advance her social and financial standing.",
      :year => 2010,
      :user_id => admin.id
    )
    easy_a_comedy = MovieGenre.create(:movie_id => easy_a.id, :genre_id => comedy.id)
    expect(MovieGenre.find_movie_genre(easy_a, comedy).first).to eq(easy_a_comedy)
  end

end
