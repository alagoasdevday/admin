class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :name
      t.string :image
      t.belongs_to :sponsor_category, index: true

      t.timestamps
    end
  end
end
