# require 'rails_helper'
#
# RSpec.describe Actor, :type => :model do
#   let(:emma_stone) {
#     Actor.create(
#       :first_name => "Emma",
#       :last_name => "Stone",
#     )
#   }
#
#   let(:penn_badgley) {
#     Actor.create(
#       :first_name => "Penn",
#       :last_name => "Badgley",
#     )
#   }
#
#   let(:molly_shannon) {
#     Actor.create(
#       :first_name => "Molly",
#       :last_name => "Shannon",
#     )
#   }
#
#   let(:will_ferrell) {
#     Actor.create(
#       :first_name => "Will",
#       :last_name => "Ferrell",
#     )
#   }
#
#   let(:comedy) {
#     Genre.create(
#       :name => "Comedy"
#     )
#   }
#
#   let(:easy_a) {
#     Movie.create(
#       :title => "Easy A",
#       :summary => "After a little white lie about losing her virginity gets out, a clean cut high school girl sees her life paralleling Hester Prynne's in 'The Scarlet Letter,' which she is currently studying in school - until she decides to use the rumor mill to advance her social and financial standing.",
#       :year => 2010,
#       :genre_id => comedy.id
#     )
#   }
#
#   let(:superstar) {
#     Movie.create(
#       :title => "Superstar",
#       :summary => "Orphan Mary Katherine Gallagher, an ugly duckling at St. Monica High School, has a dream: to be kissed soulfully. She decides she can realize this dream if she becomes a superstar, so her prayers, her fantasies, and her conversations with her only friend focus on achieving super-stardom. Her big chance is a school talent contest; her main competition is Evian, the school beauty, who is dancing with Sky, the object of Mary Katherine's kiss dream. Mary Katherine gets some talent-show help from her fellow special education students, her grandma, and Jesus, and inspiration from secrets in her past. Watching are Sky, Evian, and a silent classmate.",
#       :year => 1999,
#       :genre_id => comedy.id
#     )
#   }
# 
# let(:never_been_kissed) {
#   Movie.create(
#     :title => "Never Been Kissed",
#     :summary => "Chicago Sun Times copy editor Josie Gellar (25), who was desperate to graduate from perfectionist copy editor to reporter, gets her chance when the goody owner orders the editor to cover the high-school scene by undercover. Josie, who was a frustrated, ridiculed nerd, gets a popular make-over from her drop-out, naturally funny brother Rob Geller. Both siblings find love and joys of youth again. But in Josie's case, it's sensitive bachelor teacher Sam Coulson, who enjoys sophisticated conversation. As the publication deadline approaches, the price of blowing their cover seems ever more daunting, yet inevitable unless she sacrifices her career.",
#     :year => 1999,
#     :genre_id => romcom.id
#   )
# }

  #
  # it "has many movie_actors" do
  #   emma_easy_a = MovieActor.create(:movie_id => easy_a.id, :actor_id => emma_stone.id)
  #   penn_easy_a = MovieActor.create(:movie_id => easy_a.id, :actor_id => penn_badgley.id)
  #   molly_superstar = MovieActor.create(:movie_id => superstar.id, :actor_id => molly_shannon.id)
  #   will_superstar = MovieActor.create(:movie_id => superstar.id, :actor_id => will_ferrell.id)
  #   expect(user.reviews.first).to eq(first_review)
  #   expect(user.reviews.last).to eq(second_review)
  # end
#
# end
