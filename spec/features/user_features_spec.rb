require_relative "../rails_helper.rb"

RSpec.configure do |c|
  c.include LoginHelper
  c.include OmniauthHelper

end

OmniAuth.config.test_mode = true

describe 'Feature Test: User Signup', :type => :feature do

  it "successfully signs up as non-admin" do
    visit "/signup"
    expect(current_path).to eq("/signup")
    # user_signup method is defined in login_helper.rb
    user_signup
    expect(current_path).to eq("/users/1")
    expect(page).to have_content("Amy Poehler")
    # review content - once review & movie forms are completed
  end

  it "on sign up, successfully adds a session hash" do
    visit "/signup"
    # user_signup method is defined in login_helper.rb
    user_signup
    expect(page.get_rack_session_key("user_id")).to_not be_nil
  end

  it "successfully logs in as non-admin" do
    # user_login method is defined in login_helper.rb
    create_standard_user
    visit "/login"
    expect(current_path).to eq("/login")
    user_login
    expect(current_path).to eq("/users/1")
    expect(page).to have_content("Mindy")
    # review content - once review & movie forms are completed
  end

  # test is failing - acting as though user[:email] already exists in the database
  describe "login page" do
    it "can log in user with Google account" do
      visit "/login"
      page.should have_content("Log in with Google")
      mock_auth_hash
      click_link "Log in with Google"
      page.should have_content("Hello, mockuser")  # user name
      page.should have_content("Logout")
    end
  end

  describe "signup page" do
    it "can log in user with Google account" do
      visit "/signup"
      page.should have_content("Log in with Google")
      mock_auth_hash
      click_link "Log in with Google"
      page.should have_content("Hello, mockuser")  # user name
      page.should have_content("Logout")
    end
  end

end
