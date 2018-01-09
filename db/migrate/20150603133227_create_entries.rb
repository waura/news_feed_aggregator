class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.text :summary
      t.datetime :published_at, null: false
      t.integer :view_count
      t.integer :feed_id

      t.timestamps null: false
    end
  end
end
