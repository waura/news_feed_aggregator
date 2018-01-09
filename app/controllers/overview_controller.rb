class OverviewController < ApplicationController
  
  def index
    @new_entries = Entry.all.order("published_at desc")
    @popular_entries = Entry.all.order("view_count desc")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => {
          :new_entries => @new_entries,
          :popular_entries => @popular_entries
        }
      }
    end
  end
  
end
