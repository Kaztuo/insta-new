class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :user, type: :integer, null: false, foreign_key: true, index: true
      t.references :photo, type: :integer, null: false, foreign_key: true, index: true

      t.timestamps
    end
    add_index :likes, [:user, :photo], unique: true
  end
end
