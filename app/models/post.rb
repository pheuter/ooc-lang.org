class Post < ActiveRecord::Base
  validates :title, :presence => true
  validates :category, :presence => true
  validates :markdown, :presence => true
  belongs_to :author
  belongs_to :category
end
