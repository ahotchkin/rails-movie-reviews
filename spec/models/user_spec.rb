# require 'rails_helper'
#
# RSpec.describe User, :type => :model do
#   let(:user) {
#     User.create(
#       :username => "Mindy",
#       :email => "mindy@gmail.com"
#       :password => "password",
#     )
#   }

#
  # let(:admin) {
  #   User.create(
  #     :username => "Walt",
#       :email => "walt@gmail.com"
  #     :password => "password",
  #     :admin => true
  #   )
  # }

#   let(:easy_a) {
#     Movie.create(
#       :title => "Easy A",
#       :summary => "After a little white lie about losing her virginity gets out, a clean cut high school girl sees her life paralleling Hester Prynne's in "The Scarlet Letter," which she is currently studying in school - until she decides to use the rumor mill to advance her social and financial standing.",
#       :year => 2010,
#       :genre_id => #######
#     )
#   }
#
#   let(:superstar) {
#     Movie.create(
#       :title => "Superstar",
#       :summary => "Orphan Mary Katherine Gallagher, an ugly duckling at St. Monica High School, has a dream: to be kissed soulfully. She decides she can realize this dream if she becomes a superstar, so her prayers, her fantasies, and her conversations with her only friend focus on achieving super-stardom. Her big chance is a school talent contest; her main competition is Evian, the school beauty, who is dancing with Sky, the object of Mary Katherine's kiss dream. Mary Katherine gets some talent-show help from her fellow special education students, her grandma, and Jesus, and inspiration from secrets in her past. Watching are Sky, Evian, and a silent classmate.",
#       :year => 1999,
#     )
#   }
#
#   it "is valid with a username, email, password" do
#     expect(user).to be_valid
#   end
#
#   it "is not valid without a password" do
#     expect(User.new(username: "Name")).not_to be_valid
#   end
#
#   it "is valid with an admin boolean" do
#     expect(admin).to be_valid
#   end
#
#   it "defaults to admin => false" do
#     expect(user.admin).to eq(false)
#   end
#
#   it "has many rides" do
#     first_ride = Ride.create(:user_id => user.id, :attraction_id => roller_coaster.id)
#     second_ride = Ride.create(:user_id => user.id, :attraction_id => ferris_wheel.id)
#     expect(user.rides.first).to eq(first_ride)
#     expect(user.rides.last).to eq(second_ride)
#   end
#
#   it "has many attractions through rides" do
#     user.attractions << [roller_coaster, ferris_wheel]
#     expect(user.attractions.first).to eq(roller_coaster)
#     expect(user.attractions.last).to eq(ferris_wheel)
#   end
#
#   it "has a method 'mood' that returns 'sad' when the user is more nauseous than happy" do
#     expect(user.mood).to eq("sad")
#   end
#
#   it "has a method 'mood' that returns 'happy' when the user is more happy than nauseous" do
#     user.update(:happiness => 7)
#     expect(user.mood).to eq("happy")
#   end
#
# end
