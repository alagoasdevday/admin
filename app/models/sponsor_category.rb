class SponsorCategory < ActiveRecord::Base
  acts_as_list

  has_many :sponsors, dependent: :destroy

  after_create :update_position
  default_scope { order(:position) }

  validates_presence_of :name

  after_save :clear_cache

  private
    def clear_cache
      Rails.cache.delete("api:sponsors:all")
    end

    def update_position
      self.position = self.id
      self.save
    end
end
