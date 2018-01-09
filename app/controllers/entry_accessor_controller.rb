class EntryAccessorController < ApplicationController
  def index
    entry = Entry.find(params[:id])
    entry.view_count += 1
    entry.save

    redirect_to entry.url
  end
end
