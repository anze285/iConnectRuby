class AddFollowerIdToFollowers < ActiveRecord::Migration[6.0]
  def change
    add_column :followers, :follower_id, :integer
  end
end
