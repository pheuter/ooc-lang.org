class CreateSlogans < ActiveRecord::Migration
  def self.up
    create_table :slogans do |t|
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :slogans
  end
end
