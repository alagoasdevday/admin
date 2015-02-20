class Schedule < ActiveRecord::Base
  default_scope { order(:time) }

  belongs_to :speaker

  validates :title, presence: true
  validates :time, presence: true

  after_save :clear_cache

  private
    def clear_cache
      Rails.cache.delete("api:schedules:all")
    end
end
