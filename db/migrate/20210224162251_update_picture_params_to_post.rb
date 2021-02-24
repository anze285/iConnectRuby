class UpdatePictureParamsToPost < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :image, :string, null: false
    change_column :posts, :image_cache, :string, null: false
  end
end
