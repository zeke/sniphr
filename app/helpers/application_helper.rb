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

    label = "Install the Google Chrome extension."
    if logged_in?
      steps << link_to(label, "https://chrome.google.com/extensions/detail/dgpgdcglcodcglcglbompkodmjnoobil")
    else
      steps << label
    end
    
    steps << "Browse the web. When you see something you want to save, just hold down the shift key and click on an image or select some text. Or you can right-click on any image or snippet of selected text and click 'Sniph' from the context menu."

    content_tag(:ol, convert_to_list_items(steps), :class => "steps")
  end

end
