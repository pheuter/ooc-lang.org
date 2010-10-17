class Post < ActiveRecord::Base
  validate :title, :presence => true
  validate :markdown, :presence => true
  validate :category, :presence => true
  
  belongs_to :user
  belongs_to :category
end
