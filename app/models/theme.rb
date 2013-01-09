class Theme < ActiveRecord::Base
  attr_accessible :image, :name, :answers_count
  mount_uploader :image, ThemeUploader

  validates :image,
            :presence => true

  after_initialize :default_value

  def default_value
    self.answers_count ||= 0
  end

  has_many :answers, :dependent => :destroy
  belongs_to :user
end
