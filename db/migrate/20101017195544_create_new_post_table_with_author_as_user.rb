class CreateNewPostTableWithAuthorAsUser < ActiveRecord::Migration
  def self.up
   create_table :posts do |t|
     t.string :title
     t.references :category
     t.references :author
     t.text :content
     t.text :markdown

     t.timestamps
   end
  end

  def self.down
   drop_table :posts
  end
end
