class ChangePostToSupportUserType < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.reference :author
    end
  end

  def self.down
  end
end
