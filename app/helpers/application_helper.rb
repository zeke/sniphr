module ApplicationHelper

  def weak_if_zero(number)
    return content_tag(:span, number, :class => 'weak') if number.to_i.zero?
    number
  end

  def user_nav
    items = []
    items << link("Home", root_path)
    if logged_in?
      items << ("Logged in as " + link_to(current_user.nickname, "/sniphs/mine")).html_safe
      items << link_to("Settings", settings_path)
      items << link_to("Sign Out", signout_path)
    else
      items << link_to("Sign in with Twitter", "/auth/twitter")
    end
    content_tag(:ul, convert_to_list_items(items), :id => 'user_nav')
  end

end
