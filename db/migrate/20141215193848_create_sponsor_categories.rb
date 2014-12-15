class CreateSponsorCategories < ActiveRecord::Migration
  def change
    create_table :sponsor_categories do |t|
      t.string :name
      t.integer :position, default: 0, null: false

      t.timestamps
    end
  end
end
