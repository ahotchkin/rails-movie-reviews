module OmniauthHelper
  def mock_auth_hash
    OmniAuth.config.mock_auth[:google] = {
      :provider => "google",
      :uid => "123545",
      :user => {
        :username => "mockuser",
        :email => "mockuser@gmail.com"
      },
      :credentials => {
        :token => "mock_token",
        :secret => "mock_secret"
      }
    }
  end
end
