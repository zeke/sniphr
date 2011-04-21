class UsersController < ApplicationController

  def edit
    if !logged_in?
      redirect_to("/auth/twitter")
      return
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