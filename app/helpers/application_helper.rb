module ApplicationHelper

  def weak_if_zero(number)
    return content_tag(:span, number, :class => 'weak') if number.to_i.zero?
    number
  end

  def user_nav
    items = []
    if logged_in?
      items << current_user.nickname
      items << link_to("Sign Out", signout_path)
    else
      items << link_to("Sign in with Twitter", "/auth/twitter")
    end
    content_tag(:ul, convert_to_list_items(items), :id => 'user_nav')
  end

end
