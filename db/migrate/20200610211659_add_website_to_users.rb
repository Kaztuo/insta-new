class AddWebsiteToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :website, :string
    add_column :users, :self_introduction, :text
    add_column :users, :email, :string
    add_column :users, :phone_number, :integer
    add_column :users, :gender, :integer
  end
end
