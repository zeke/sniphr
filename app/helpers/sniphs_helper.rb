module SniphsHelper
  include ActsAsTaggableOn::TagsHelper
  
  def sniph_tag_cloud(tags, options={})
    items = []
    tag_cloud(tags, %w(tag1 tag2 tag3 tag4)) do |tag, css_class|
      path = options[:user] ? my_sniphs_path(:tag => tag.name) : sniphs_path(:tag => tag.name)
      items << link_to(tag.name, path, :class => css_class)
    end
    content_tag(:ul, convert_to_list_items(items), :class => "tag_cloud")
  end

  def sniph_heading(sniphs=nil)
    out = []

    if request.path == my_sniphs_path
      out << "Your" 
      out << link_to(pluralize(sniphs.total_entries, "Sniph"), root_path, :class => "rogue")
    else
      out << link_to(pluralize(sniphs.total_entries, "public Sniph"), root_path, :class => "rogue")
    end

    if params[:user].present?
      out << "sniph&rsquo;d by"
      out << content_tag(:span, "#{params[:user]}".html_safe, :class => 'user')
    end

    if params[:q].present?
      out << "matching"
      out << content_tag(:span, "#{params[:q]}".html_safe, :class => 'q')
    end
    
    if params[:tag].present?
      out << "tagged with"
      out << content_tag(:span, "#{params[:tag]}".html_safe, :class => 'tag')
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
      out << link_to('You', my_sniphs_path)
      out << link_to("Delete", sniph_path(sniph), :method => :delete, :remote => true, :class => 'delete')
      # out << link_to("delete", "#{sniph_path(sniph)}.json", :method => :delete, :remote => true, :class => "remove", :confirm => 'Are you sure?')

		end
		out.join(" ").html_safe
  end

  def sniph_tags(sniph)
    names = sniph.tags.map do |tag|
      next if tag.name.include? '%'
      tag.name
    end.compact.sort
    
    names.map do |name|
      p = {:tag => name}
      p[:q] = params[:q] if params[:q].present?
      link_to(name, sniphs_path(p))
    end.join(' ').html_safe
  end

  def sample_sniph_queries
    paths = [
      sniphs_path,
      sniphs_path(:q => 'nytimes.com', :format => 'json'),
      sniphs_path(:q => 'economist.com', :format => 'json'),
      sniphs_path(:q => 'en.wikipedia.org', :format => 'json'),
      sniphs_path(:q => 'google.com', :user => "zeke", :format => 'json'),
      sniphs_path(:q => 'economist.com/node/18530079', :format => 'json'),
      sniphs_path(:format => 'json'),
    ]
    links = paths.map do |path|
      link_to(path, path)
    end

    # links = links.unshift("Example queries")
  	content_tag(:ul, convert_to_list_items(links), :class => 'samples')
  end


end