class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :title
      t.time :time
      t.belongs_to :speaker, index: true

      t.timestamps
    end

    remove_column :speakers, :time
  end
end
