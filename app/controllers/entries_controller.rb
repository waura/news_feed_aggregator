class EntriesController < ApplicationController

  def index
    @entries = Entry.all

    logger.debug "entries size = #{@entries.length}"

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => {
        :entries => @entries
      }}
    end
  end

end
