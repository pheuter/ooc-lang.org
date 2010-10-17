class Post < ActiveRecord::Base
  validates_presence_of :title, :category, :markdown
  belongs_to :category
  attr_accessible :author
end
