class SniphsController < ApplicationController

  before_filter :allow_cross_domain_access

  # Allow Ajax requests
  def allow_cross_domain_access
    response.headers["Access-Control-Allow-Origin"] = "*"
    response.headers["Access-Control-Allow-Methods"] = "*"
  end

  def index

    @users = User.all
    @users = @users.sort { |a,b| b.sniphs.where(:publique=> true).count <=> a.sniphs.where(:publique=> true).count }
    
    @tags = Sniph.where(:publique => true).tag_counts_on(:tags).sort_by(&:name)
    @user_tags = current_user.sniphs.tag_counts_on(:tags).sort_by(&:name) if logged_in?

    @sniphs = Sniph.includes(:user, :tags).order('sniphs.created_at DESC')
    if logged_in? && request.path == my_sniphs_path
      @sniphs = @sniphs.where(:user_id => current_user.id)
    else
      @sniphs = @sniphs.where(:publique => true)
      
      # Undocumented way to view one user's public sniphs
      # TODO: Make UI hooks for this
      if params[:user]
        @user = User.find_by_nickname(params[:user])
        @sniphs = @sniphs.where(:user_id => @user.id)
      end
      
    end    
    @sniphs = @sniphs.tagged_with(params[:tag]) if params[:tag]
    @sniphs = @sniphs.where("url LIKE ? OR content LIKE ? OR title LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%") if params[:q]
    @sniphs = @sniphs.paginate(:page => params[:page], :per_page => configatron.pagination.per_page)

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

  def show
    render :text => "show is not yet implemented"
  end

  def save
    if !logged_in?
      response_object = {:msg => 'You are not logged in.'}

    # Bail if URL's domain is not whitelisted (unless user is forcing the save by holding down a modifier key)
    elsif !current_user.url_domain_allowed?(params[:sniph][:url]) && params[:force].blank?
      response_object = {:msg => "This URL's domain is not in your whitelist." }

    else
      @sniph = current_user.sniphs.new(params[:sniph])
      @sniph.publique = current_user.public_mode?
      response_object = @sniph.save ? {:msg => 'Success', :sniph => @sniph.attributes} : {:msg => @sniph.errors}
    end

    respond_to do |format|
      format.json { render :json => response_object.to_json }
    end
  end
  
  def destroy
    @sniph = current_user.sniphs.find(params[:id])
    @sniph.destroy
    
    respond_to do |format|
      format.html do 
        if request.xhr?
          render :json => @sniph.to_json
        else
          redirect_to(my_sniphs_path, :notice => "Sniph #{@sniph.id} wiped!")
        end
      end
    end
  end


end
