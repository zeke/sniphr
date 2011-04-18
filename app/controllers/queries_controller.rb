class QueriesController < ApplicationController

  def index
    @queries = Query.order('created_at DESC')
    @queries = @queries.limit(50)
    @query_count = Query.count
    
    respond_to do |format|
      format.html
      format.json { render :json => @queries.to_json}
    end
  end
  
end
