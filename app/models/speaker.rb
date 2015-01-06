class Speaker < ActiveRecord::Base
  default_scope { order(:time) }

  scope :confirmed, -> { where(confirmed: true) }
  scope :unconfirmed, -> { where(confirmed: false) }

  validates_presence_of :name
  validates_presence_of :speaker_image
  validates_presence_of :company_image
  validates_presence_of :theme
  validates_presence_of :time

  mount_uploader :speaker_image, ImageUploader
  mount_uploader :company_image, ImageUploader

  after_save :clear_cache

  private
    def clear_cache
      Rails.cache.delete("api:speakers:all")
    end
end
