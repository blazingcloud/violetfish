class CreateVersions < ActiveRecord::Migration
  def self.up
    create_table :versions do |t|
      t.string :name, :null => false
      t.integer :tech_id

      t.timestamps
    end
  end

  def self.down
    drop_table :versions
  end
end
