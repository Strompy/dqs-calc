module  Helpers
  module Login
    def sign_in_as(user)
      visit new_session_path
      fill_in 'user_username', with: user.username
      fill_in 'user_password', with: user.password
      click_on 'Log in'
    end
  end
end
