class AddPostIdToLocations < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :post_id, :reference
  end
end
