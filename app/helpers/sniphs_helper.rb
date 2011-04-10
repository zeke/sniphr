module SniphsHelper

  def sniph_heading
    out = ["Sniphs"]
    if params[:q].present?
      out << "matching"
      out << content_tag(:span, "#{params[:q]}", :class => 'q')
    end
    content_tag(:h1, out.join(' ').html_safe)
  end

end