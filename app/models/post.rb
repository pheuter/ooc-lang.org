class Post < ActiveRecord::Base
  validates_presence_of :title, :author, :category, :content
  belongs_to :category
end
