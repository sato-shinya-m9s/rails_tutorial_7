class CreateLikes < ActiveRecord::Migration[7.0]
  def up
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :micropost, null: false, foreign_key: true

      t.timestamps
    end
    add_index :likes, [:user_id, :micropost_id], unique: true
  end

  def down
    drop_table :likes
  end
end
