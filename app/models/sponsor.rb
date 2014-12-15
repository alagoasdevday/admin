class Sponsor < ActiveRecord::Base
  belongs_to :sponsor_category

  validates_presence_of :name
  validates_presence_of :image
  validates_presence_of :sponsor_category

  mount_uploader :image, ImageUploader
end
