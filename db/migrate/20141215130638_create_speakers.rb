class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.string :name
      t.string :company_image
      t.string :speaker_image
      t.string :theme
      t.string :twitter_url
      t.string :facebook_url
      t.string :linkedin_url
      t.string :speakerdeck_url
      t.string :video_url
      t.time :time
      t.boolean :confirmed, default: false

      t.timestamps
    end
  end
end
