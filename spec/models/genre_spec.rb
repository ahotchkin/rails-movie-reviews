require 'rails_helper'

RSpec.describe Genre, :type => :model do
  let(:comedy) {
    Genre.create(
      :name => "Comedy"
    )
  }

  it "is valid with a name" do
    expect(comedy).to be_valid
  end

  # it "is not valid without a name" do
  #   expect(Genre.new).to_not be_valid
  # end
  it { should validate_presence_of(:name) }

  # it "has many movies" do
  #   easy_a = Movie.create(
  #     :title => "Easy A",
  #     :synopsis => "After a little white lie about losing her virginity gets out, a clean cut high school girl sees her life paralleling Hester Prynne's in 'The Scarlet Letter,' which she is currently studying in school - until she decides to use the rumor mill to advance her social and financial standing.",
  #     :year => 2010,
  #   )
  #   superstar = Movie.create(
  #     :title => "Superstar",
  #     :synopsis => "Orphan Mary Katherine Gallagher, an ugly duckling at St. Monica High School, has a dream: to be kissed soulfully. She decides she can realize this dream if she becomes a superstar, so her prayers, her fantasies, and her conversations with her only friend focus on achieving super-stardom. Her big chance is a school talent contest; her main competition is Evian, the school beauty, who is dancing with Sky, the object of Mary Katherine's kiss dream. Mary Katherine gets some talent-show help from her fellow special education students, her grandma, and Jesus, and inspiration from secrets in her past. Watching are Sky, Evian, and a silent classmate.",
  #     :year => 1999,
  #   )
  #   expect(comedy.movies.first).to eq(easy_a)
  #   expect(comedy.movies.last).to eq(superstar)
  # end
  it { should have_many(:movies) }

end
