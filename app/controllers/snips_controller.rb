class SnipsController < ApplicationController

  before_filter :allow_cross_domain_access

  # Allow Ajax requests
  def allow_cross_domain_access
    response.headers["Access-Control-Allow-Origin"] = "*"
    response.headers["Access-Control-Allow-Methods"] = "*"
  end

  def index

    if params[:q]
      @snips = Snip.where("snips.url LIKE ? OR snips.content LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%").order('snips.created_at ASC')
    else
      @snips = Snip.all
    end

    respond_to do |format|
      format.html
      format.json { render :json => @snips.to_json, :callback => params[:callback] }
    end
  end

  def show
    @snip = Snip.find(params[:id])
    respond_to do |format|
      format.json { render :json => @snip.to_json, :callback => params[:callback] }
    end
  end

  def save
    @snip = Snip.new(params[:snip])
    respond_to do |format|
      if @snip.save
        format.json { render :json => {:msg => 'Success', :id => @snip.id}.to_json, :callback => params[:callback] }
      else
        format.json { render :json => {:msg => 'Error'}.to_json, :callback => params[:callback] }
      end
    end
  end

end
