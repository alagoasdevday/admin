class AddGithubUrlToSpeakers < ActiveRecord::Migration
  def change
    add_column :speakers, :github_url, :string, after: :facebook_url
  end
end
