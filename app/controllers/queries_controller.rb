class QueriesController < ApplicationController

  def index
    @queries = Query.order('created_at DESC')
    @queries = @queries.where("q LIKE ?", "%#{params[:q]}%") if params[:q]
    @queries = @queries.where(:user => params[:user]) if params[:user]
    @queries = @queries.where(:from_user => params[:from_user]) if params[:from_user]
    @queries = @queries.paginate(:page => params[:page], :per_page => 200)

    @user_names = Query.select('DISTINCT from_user').map(&:from_user).compact
    @user_names.delete('undefined')

    respond_to do |format|
      format.html
      format.json { render :json => @queries.to_json}
    end
  end

end
