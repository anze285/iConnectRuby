class AddParamsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :picture_cache, :string
  end
end
