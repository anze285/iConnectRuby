class UpdatePictureCacheParamsToPost < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :image_cache, :string, null: true
  end
end
