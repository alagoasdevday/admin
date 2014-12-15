class Speaker < ActiveRecord::Base
  scope :confirmed, -> { where(confirmed: true) }
  scope :unconfirmed, -> { where(confirmed: false) }

  mount_uploader :speaker_image, ImageUploader
  mount_uploader :company_image, ImageUploader

  validates_presence_of :name
end
