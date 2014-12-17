class SponsorCategory < ActiveRecord::Base
  acts_as_list

  has_many :sponsors, dependent: :destroy

  after_create :update_position
  default_scope { order(:position) }

  validates_presence_of :name

  private
    def update_position
      self.position = self.id
      self.save
    end
end
