class AddEntryTitleSlectorToFeeds < ActiveRecord::Migration
  def change
    add_column :feeds, :entry_title_selector, :string
  end
end
