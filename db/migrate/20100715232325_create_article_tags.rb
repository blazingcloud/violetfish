class CreateArticleTags < ActiveRecord::Migration
  def self.up
    create_table :article_tags do |t|
      t.integer :article_id, :null => false
      t.integer :version_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :article_tags
  end
end
