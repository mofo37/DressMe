module ApplicationHelper
  def sign_in_or_sign_up
    if on_sign_in_page?
      'Sign in'
    else
      'Sign up'
    end 
  end

  def on_sign_in_page?
    controller_name == 'sessions'
  end
end
