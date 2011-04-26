class SessionsController < ApplicationController

  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_url, :notice => "Signed in!"
  end

  def failure
    render :text=> "Login failed."
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
  
  # Didn't work if it was named 'status'..
  def session_status
    response_object = {}
    if logged_in?
      response_object[:msg] = "You are logged in as #{current_user.nickname}"
      response_object[:user] = current_user
    else
      response_object[:msg] = "You are not logged in."
    end
  
    respond_to do |format|
      format.json { render :json => response_object.to_json }
    end
    
  end

end