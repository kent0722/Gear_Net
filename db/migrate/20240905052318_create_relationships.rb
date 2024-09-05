class CreateRelationships < ActiveRecord::Migration[7.1]
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :followee_id

      t.timestamps
    end
    add_index :relationships, :follower_id
    add_index :relationships, :followee_id
  end
end
