# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :comment
      t.references :photo, null: false, foreign_key: true

      t.timestamps
    end
    add_index :comments, %i[photo_id created_at]
  end
end
