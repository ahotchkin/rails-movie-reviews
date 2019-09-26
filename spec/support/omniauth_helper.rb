module OmniauthHelper
  
  def mock_auth_hash
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google] = {
      :provider => "google",
      :uid => "123545",
      :info => {
        :first_name => "mockuser",
        :email => "mockuser@gmail.com"
      },
      :credentials => {
        :token => "mock_token",
        :secret => "mock_secret"
      }
    }
  end

end
