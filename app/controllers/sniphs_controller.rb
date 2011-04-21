class SniphsController < ApplicationController

  before_filter :allow_cross_domain_access

  # Allow Ajax requests
  def allow_cross_domain_access
    response.headers["Access-Control-Allow-Origin"] = "*"
    response.headers["Access-Control-Allow-Methods"] = "*"
  end

  def index
    @sniphs = Sniph.order('created_at DESC')
    @sniphs = @sniphs.where(:publique => true) unless params[:private].present?
    @sniphs = @sniphs.where("url LIKE ? OR content LIKE ? OR title LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%") if params[:q]
    @sniphs = @sniphs.where(:user => params[:user]) if params[:user]

    # Save this query if searching for a term or a user
    if params[:q].present? || params[:user].present?

      # There are a few params we're not interested in..
      all_params = params.dup
      all_params.delete(:action)
      all_params.delete(:controller)

      @query = Query.create(
        :q => params[:q],
        :user => params[:user],
        :from_user => params[:from_user],
        :ip => request.remote_ip,
        :all_params => all_params,
        :num_results => @sniphs.size
      )
    end

    respond_to do |format|
      format.html
      format.json { render :json => @sniphs.to_json, :callback => params[:callback] }
    end
  end

  def show
    @sniph = Sniph.find(params[:id])
    respond_to do |format|
      format.json { render :json => @sniph.to_json, :callback => params[:callback] }
    end
  end

  def save
    if !logged_in?
      response_object = {:msg => 'You are not logged in.'}
    else
      @sniph = current_user.sniphs.new(params[:sniph])
      response_object = @sniph.save ? {:msg => 'Success', :id => @sniph.id} : {:msg => @sniph.errors}
    end

    respond_to do |format|
      format.json { render :json => response_object.to_json }
    end
  end

end
