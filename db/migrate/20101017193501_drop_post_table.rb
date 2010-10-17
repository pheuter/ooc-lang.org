class DropPostTable < ActiveRecord::Migration
  def self.up
  end

  def self.down
    drop_table :posts
  end
end
