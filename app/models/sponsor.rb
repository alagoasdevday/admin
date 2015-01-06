class Sponsor < ActiveRecord::Base
  belongs_to :sponsor_category

  validates_presence_of :name
  validates_presence_of :image
  validates_presence_of :sponsor_category

  mount_uploader :image, ImageUploader

  after_save :clear_cache

  private
    def clear_cache
      Rails.cache.delete("api:sponsors:all")
    end
end
