class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.integer :brand, null: false
      t.integer :category, null: false
      t.integer :production_year
      t.string :instrument_model
      t.string :image
      t.string :video
      t.text :body, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
