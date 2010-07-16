class CreateTeches < ActiveRecord::Migration
  def self.up
    create_table :teches do |t|
      t.string :name, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :teches
  end
end
