require 'uri'

module QueriesHelper

  def query_heading(queries)
    out = []

    # 0 Sniphs, 1 Query, 234 Queries
    out << link_to(pluralize(queries.total_entries, "Query"), queries_path, :class => "rogue")

    # From bob
    if params[:from_user].present?
      out << "from user"
      out << content_tag(:span, "#{params[:from_user]}".html_safe, :class => 'user')
    end

    # For sally
    if params[:user].present?
      out << "for user"
      out << content_tag(:span, "#{params[:user]}".html_safe, :class => 'user')
    end

    # matching
    if params[:q].present?
      out << "matching"
      out << content_tag(:span, "#{params[:q]}".html_safe, :class => 'q')
    end

    content_tag(:h1, out.join(' ').html_safe)
  end

  def query_q(query)
    if query.q.valid_url?
      url = URI.parse(query.q).to_s
      link_to(truncate(url.remove_http_and_www, :length => 80), url)
    else
      truncate(query.q, :length => 80)
    end
  end

end