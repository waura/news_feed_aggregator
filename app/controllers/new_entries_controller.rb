class NewEntriesController < ApplicationController

  def index
    @entries = Entry.all.order("published_at desc")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => {
        :entries => @entries
      }}
    end
  end

end
