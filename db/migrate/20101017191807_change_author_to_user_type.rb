class ChangeAuthorToUserType < ActiveRecord::Migration
  def self.up
    add_column :posts, :author, :reference
  end

  def self.down
    remove_column :posts, :author
  end
end
