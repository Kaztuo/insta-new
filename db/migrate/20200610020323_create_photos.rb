# frozen_string_literal: true

class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :photos, %i[user_id created_at]
  end
end
