class AddFieldsToSpeakers < ActiveRecord::Migration
  def change
    add_column :speakers, :bio, :text
    add_column :speakers, :company_name, :string
  end
end
