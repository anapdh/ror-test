module ApplicationHelper
  def display_functional_navigation(_user)
    out = ''
    out +=
      if user_signed_in?
        "<li class='nav-link'>#{link_to(current_user.email)} #{user_type(_user)}</li>
        <li class='nav-link'>#{link_to('Logout', destroy_user_session_path, method: 'delete', id: 'logout_btn')}</li>"
      else
        "<li class='nav-link'>#{link_to('Login', new_user_session_path)}</li>
        <li class='nav-link'>#{link_to('Sign up', new_user_registration_path)}</li>"
      end
    out.html_safe
  end

  def user_type(_user)
    if current_user.is_admin?
      '(logged as Admin)'
    else
      '(logged as guest)'
    end
  end
end
