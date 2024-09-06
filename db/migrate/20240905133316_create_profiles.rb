class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.integer :age
      t.text :introduction
      t.string :instrument
      t.string :favorite_music
      t.string :favorite_artist
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
