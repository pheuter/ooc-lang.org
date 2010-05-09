class Post < ActiveRecord::Base
  validates_presence_of :title, :category, :content
  belongs_to :category
end
