class Slogan < ActiveRecord::Base
  def self.random
    if (c = count) != 0
      find(:first, :offset =>rand(c)).title
    end
  end
end