class SniphsController < ApplicationController

  before_filter :allow_cross_domain_access

  # Allow Ajax requests
  def allow_cross_domain_access
    response.headers["Access-Control-Allow-Origin"] = "*"
    response.headers["Access-Control-Allow-Methods"] = "*"
  end

  def index

    if params[:q]
      @sniphs = Sniph.where("sniphs.url LIKE ? OR sniphs.content LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%").order('sniphs.created_at ASC')
    else
      @sniphs = Sniph.all
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
    @sniph = Sniph.new(params[:sniph])
    respond_to do |format|
      if @sniph.save
        format.json { render :json => {:msg => 'Success', :id => @sniph.id}.to_json, :callback => params[:callback] }
      else
        format.json { render :json => {:msg => 'Error'}.to_json, :callback => params[:callback] }
      end
    end
  end

end
