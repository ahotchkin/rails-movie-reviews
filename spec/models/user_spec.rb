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

  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
    it { should have_secure_password }

    it "is valid with an admin boolean" do
      expect(admin).to be_valid
    end

    it "defaults to admin => false" do
      expect(user.admin).to eq(false)
    end
  end

  describe "associations" do
    it { should have_many(:movies) }
    it { should have_many(:reviews) }
    it { should have_many(:reviewed_movies).through(:reviews).source(:movie) }
  end

  # describe "OmniAuth login" do
  #   it "finds or creates itself from an oauth hash" do
  #     auth = {
  #       :provider => "google",
  #       :uid => "123545",
  #       :info => {
  #         :first_name => "testuser",
  #         :email => "testuser@gmail.com"
  #       },
  #       :credentials => {
  #         :token => "test_token",
  #         :secret => "test_secret"
  #       }
  #     }
  #     User.from_omniauth(auth)
  #     new_user = User.first
  #     expect(new_user.provider).to eq("google")
  #     expect(new_user.uid).to eq("123545")
  #     expect(new_user.email).to eq("testuser@gmail.com")
  #     expect(new_user.username).to eq("testuser")
  #     expect(new_user.token).to eq("test_token")
  #     expect(new_user.secret).to eq("test_secret")
  #   end
  # end

  # def self.from_omniauth(auth)
  #   @user = User.find_or_create_by(:uid => auth[:uid]) do |user|
  #     if !User.find_by(:username => auth[:info][:first_name])
  #       user.username = auth[:info][:first_name]
  #     else
  #       user.username = auth[:info][:first_name] + auth[:uid]
  #     end
  #     user.email = auth[:info][:email]
  #     user.password = SecureRandom.hex
  #   end
  # end

end
