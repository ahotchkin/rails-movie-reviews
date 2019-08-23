module LoginHelper

  def user_signup
    fill_in("user[username]", :with => "Amy Poehler")
    fill_in("user[email]", :with => "amy@gmail.com")
    fill_in("user[password]", :with => "password")
    click_button("Sign Up")
  end

  def user_login
    fill_in("user[username]", :with =>"Mindy")
    fill_in("user[password]", :with => "password")
    click_button("Log In")
  end

  def admin_signup
    fill_in("user[username]", :with => "Walt Disney")
    fill_in("user[email]", :with => "walt@gmail.com")
    fill_in("user[password]", :with => "password")
    find("user[admin]").set(true)
    # find(:css, "#user_admin").set(true)
    click_button("Create User")
  end

  def admin_login
    select "Walt Disney",from:"username"
    fill_in("password", :with => "password")
    click_button("Sign In")
  end

  def create_standard_user
    @mindy = User.create(
      :username => "Mindy",
      :email => "mindy@gmail.com",
      :password => "password",
    )
  end

  def create_standard_and_admin_user
    @mindy = User.create(
      :username => "Mindy",
      :email => "mindy@gmail.com",
      :password => "password",
    )
    @walt = User.create(
      :username => "Walt",
      :email => "walt@gmail.com",
      :password => "password",
      :admin => true
    )
  end

end
