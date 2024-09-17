class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :subject, polymorphic: true, null: false
      t.integer :action
      t.boolean :checked, default: false

      t.timestamps
    end
  end
end
