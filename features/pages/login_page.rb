
class LoginPage < SitePrism::Page

  set_url 'https://id.atlassian.com/login'

# -- field --
  element :username_field, '#username'
  element :password_field, '#password'

# -- button --
  element :log_in_button, '#login-submit'

  def log_in_as( user )

    @user = get_user_info user
    username_field.set @user[ 'username' ]
    password_field.set @user[ 'password' ]
    log_in_button.click

  end

end