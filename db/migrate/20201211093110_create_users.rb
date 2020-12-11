class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.text :bio
      t.string :email
      t.string :phone_number
      t.string :password

      t.timestamps
    end
  end
end
