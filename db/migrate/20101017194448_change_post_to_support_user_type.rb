class ChangePostToSupportUserType < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.references :author
    end
  end

  def self.down
  end
end