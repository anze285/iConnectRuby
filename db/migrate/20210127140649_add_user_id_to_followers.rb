class AddUserIdToFollowers < ActiveRecord::Migration[6.0]
  def change
    add_column :followers, :user_id, :reference
  end
end
