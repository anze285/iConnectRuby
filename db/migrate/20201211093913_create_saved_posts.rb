class CreateSavedPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :saved_posts do |t|

      t.timestamps
    end
  end
end
