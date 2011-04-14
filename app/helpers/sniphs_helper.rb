module SniphsHelper

  def sniph_heading
    out = []
    out << "Sniphs"

    if params[:user].present?
      out << "from"
      out << content_tag(:span, "#{params[:user]}".html_safe, :class => 'user')
    end

    if params[:q].present?
      out << "matching"
      out << content_tag(:span, "&lsquo;#{params[:q]}&rsquo;".html_safe, :class => 'q')
    end

    content_tag(:h1, out.join(' ').html_safe)
  end

end