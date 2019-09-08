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

end
