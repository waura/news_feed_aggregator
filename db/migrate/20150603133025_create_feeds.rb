class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.datetime :last_modified

      t.timestamps null: false
    end
  end
end
