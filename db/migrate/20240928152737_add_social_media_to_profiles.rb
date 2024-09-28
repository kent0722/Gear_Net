class AddSocialMediaToProfiles < ActiveRecord::Migration[7.1]
  def change
    add_column :profiles, :youtube_url, :string
    add_column :profiles, :x_url, :string
  end
end
