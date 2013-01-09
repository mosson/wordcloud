class Page < ActiveRecord::Base
  attr_accessible :source, :permalink

  validates_uniqueness_of :permalink
end
