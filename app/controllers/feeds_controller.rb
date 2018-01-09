class FeedsController < ApplicationController
  def index
    @feeds = Feed.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => {
        :feeds => @feeds
      }}
    end
  end

  def show
    @feed = Feed.find(params[:id])
    #@entries = @feed.entries.includes([:feed, :clip]).page params[:page]
    #@category = @feed.category

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json=>{
        :feed     => @feed
      }}
    end
  end  
end
