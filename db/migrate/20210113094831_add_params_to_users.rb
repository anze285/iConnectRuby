class AddParamsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_index :users, :username, unique: true
    add_column :users, :fullname, :string
    add_column :users, :phone, :string
  end
end
