class UsersController < ApplicationController

  def index
    @users = User.includes(:sniphs)#.order('sniphs.created_at DESC')
  end
    
  def edit
    if !logged_in?
      redirect_to(root_path)
      return
    end
  end

  def chrome_options
    if params[:last_url].present?
      @current_url = params[:last_url]
      @domain = @current_url.domain_without_www
      @num_sniphs_at_url = Sniph.where("url LIKE ?", "%#{@current_url}%").count
      @num_sniphs_at_domain = Sniph.where("url LIKE ?", "%#{@domain}%").count
    end

    respond_to do |format|
      format.html
    end
  end

  def update
    respond_to do |format|
      if current_user.update_attributes(params[:user])
        format.html { redirect_to(root_path, :notice => 'Settings saved.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

end