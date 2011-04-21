class SniphsController < ApplicationController

  before_filter :allow_cross_domain_access

  # Allow Ajax requests
  def allow_cross_domain_access
    response.headers["Access-Control-Allow-Origin"] = "*"
    response.headers["Access-Control-Allow-Methods"] = "*"
  end

  def index
    if logged_in? && params[:whose]
      @sniphs = current_user.sniphs.order('created_at DESC')
    else
      @sniphs = Sniph.order('created_at DESC').where(:publique => true)
    end

    @sniphs = @sniphs.where("url LIKE ? OR content LIKE ? OR title LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%") if params[:q]
    @sniphs = @sniphs.paginate(:page => params[:page], :per_page => 200)

    # Save this query if searching for a term
    if params[:q].present?
      @query = Query.create(
        :q => params[:q],
        :ip => request.remote_ip,
        :num_results => @sniphs.size
      )

      # Associate this query with the logged-in user
      current_user.queries << @query if logged_in?
    end

    respond_to do |format|
      format.html
      format.json { render :json => @sniphs.to_json, :callback => params[:callback] }
    end
  end

  def save
    if !logged_in?
      response_object = {:msg => 'You are not logged in.'}
    elsif !current_user.url_domain_allowed?(params[:sniph][:url])
      response_object = {:msg => "This URL's domain is not in your whitelist." }
    else
      @sniph = current_user.sniphs.new(params[:sniph])
      @sniph.publique = current_user.public_mode?
      response_object = @sniph.save ? {:msg => 'Success', :id => @sniph.id} : {:msg => @sniph.errors}
    end

    respond_to do |format|
      format.json { render :json => response_object.to_json }
    end
  end

end
