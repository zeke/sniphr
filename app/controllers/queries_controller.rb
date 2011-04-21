class QueriesController < ApplicationController

  def index
    @queries = Query.order('created_at DESC')
    @queries = @queries.where("q LIKE ?", "%#{params[:q]}%") if params[:q]
    @queries = @queries.paginate(:page => params[:page], :per_page => 200)

    respond_to do |format|
      format.html
      format.json { render :json => @queries.to_json}
    end
  end

end
