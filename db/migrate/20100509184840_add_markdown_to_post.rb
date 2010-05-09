class AddMarkdownToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :markdown, :text
  end

  def self.down
  end
end
