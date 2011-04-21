module SniphsHelper


  def sniph_heading(sniphs=nil)
    out = []

    # 0 Sniphs, 1 Sniph, 234 Sniphs
    out << "Your" if params[:whose]

    out << link_to(pluralize(sniphs.total_entries, "Sniph"), root_path, :class => "rogue")

    if params[:user].present?
      out << "sniph&rsquo;d by"
      out << content_tag(:span, "#{params[:user]}".html_safe, :class => 'user')
    end

    if params[:q].present?
      out << "matching"
      out << content_tag(:span, "#{params[:q]}".html_safe, :class => 'q')
    end
    content_tag(:h1, out.join(' ').html_safe)
  end

  def sniph_content(sniph)
    content = sniph.content.dup.strip_tags
    content.gsub!(/(#{params[:q]})/i, "<span class='q'>#{params[:q]}</span>") if params[:q].present?
    content.html_safe
  end

  # Generates a link to the sniph using page title and domain
  def sniph_source(sniph)
    label = []
    if sniph.title.present?
      label << sniph.title
      label << content_tag(:span, "(#{sniph.url.domain_without_www})", :class => 'domain')
    else
      label << truncate(sniph.url.remove_http_and_www, :length => 70)
    end
    link_to(label.join(" ").html_safe, sniph.url)
  end

  # e.g. "Saved about five minutes ago by joe_sniffington"
  def sniph_metadata(sniph)
    out = []
    out << "Saved"
    out << time_ago_in_words_or_date(sniph.created_at)
    if sniph.user == current_user
		  out << "by"
      out << link_to('You', "/sniphs/mine")
		end
		out.join(" ").html_safe
  end

  def sample_sniph_queries
    paths = [
      sniphs_path,
      sniphs_path(:q => 'nytimes.com'),
      sniphs_path(:q => 'economist.com', :format => 'json'),
      sniphs_path(:q => 'en.wikipedia.org'),
      sniphs_path(:q => 'google.com', :user => "zeke"),
      sniphs_path(:q => 'economist.com/node/18530079'),
      sniphs_path(:format => 'json'),
    ]
    links = paths.map do |path|
      link_to(path, path)
    end

    links = links.unshift("Example queries")
  	content_tag(:ul, convert_to_list_items(links), :class => 'samples')
  end


end