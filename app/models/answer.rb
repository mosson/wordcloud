class Answer < ActiveRecord::Base
  attr_accessible :comment, :theme_id, :ip, :user_id

  belongs_to :theme, :counter_cache => true, :autosave => true
end
