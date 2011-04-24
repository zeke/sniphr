module ApplicationHelper

  def weak_if_zero(number)
    return content_tag(:span, number, :class => 'weak') if number.to_i.zero?
    number
  end

  def logo
    link("sniphr", root_path, :id => 'logo')
  end

  def user_nav
    items = []
    items << content_tag(:form, :action => sniphs_path, :class => "search") do
      text_field_tag(:q, params[:q], :placeholder => "Search", :class => 'q')
    end
    if logged_in?
      items << link("My sniphs", "/sniphs/mine")
      items << link("Settings", settings_path)
    else
      items << link("Sign in with Twitter", "/auth/twitter")
    end
    items << link("About", about_path)
    items << link("Sign out", signout_path) if logged_in?

    content_tag(:ul, convert_to_list_items(items), :id => 'user_nav')
  end

  def installation_steps
    steps = []

    label = "Sign in with your Twitter account.".html_safe
    css = logged_in? ? "complete" : ""
    steps << link_to(label, "/auth/twitter", :class => css)

    label = "Configure your account's level of publicity."
    if logged_in? && current_user.manually_configured?
      steps << link_to(label, settings_path, :class => "complete")
    elsif logged_in?
      steps << link_to(label, settings_path)
    else
      steps << label
    end

    label = "Install the Chrome extension."
    if logged_in? && current_user.manually_configured?
      steps << link_to(label, "https://chrome.google.com/extensions/detail/dgpgdcglcodcglcglbompkodmjnoobil")
    else
      steps << label
    end

    content_tag(:ol, convert_to_list_items(steps), :class => "steps")
  end

  def usage_steps
    steps = []
    steps << "Browse the web. Any text you highlight will be saved automatically for domains you've whitelisted."
    steps << "To save a text selection on a page that's not in your whitelist, hold down SHIFT while selecting."
    content_tag(:ol, convert_to_list_items(steps), :class => "steps")
  end

end
