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
      text_field_tag(:q, params[:q], :placeholder => "Search all sniphs", :class => 'q')
    end
    items << link("All", sniphs_path)
    if logged_in?
      items << link("Mine", my_sniphs_path)
      items << link("Settings", settings_path)
    else
      items << link("Sign in with Twitter", "/auth/twitter")
      items << link("Sign in with Facebook", "/auth/facebook")
    end
    items << link("FAQ", faq_path)
    items << link("Sign out", signout_path) if logged_in?

    content_tag(:ul, convert_to_list_items(items), :id => 'user_nav')
  end

  def installation_steps
    steps = []
    
    if logged_in?
      steps << content_tag(:span, "Sign in.", :class => 'complete')
    else
      steps << ("Sign in with " + link("Twitter", "/auth/twitter") + " or " + link("Facebook", "/auth/facebook") + ".").html_safe
    end

    # label = "Configure your account's level of publicity."
    # if logged_in? && current_user.manually_configured?
    #   steps << link_to(label, settings_path, :class => "complete")
    # elsif logged_in?
    #   steps << link_to(label, settings_path)
    # else
    #   steps << label
    # end

    label = "Install the Chrome extension."
    if logged_in?
      steps << link_to(label, "https://chrome.google.com/extensions/detail/dgpgdcglcodcglcglbompkodmjnoobil")
    else
      steps << label
    end
    
    steps << "Browse the web! To save sniphs, hold down the shift key while selecting text, or right-click on the text after selecting it."

    content_tag(:ol, convert_to_list_items(steps), :class => "steps")
  end

end
