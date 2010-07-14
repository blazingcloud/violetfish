class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :title, :null => false
      t.string :url, :null => false
      t.string :author
      t.date :published_on

      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
