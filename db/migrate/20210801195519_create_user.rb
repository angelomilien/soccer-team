class CreateUser < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :user_name
      t.string :email
      t.string :password_digest
      t.string :image
      t.string :uid


      t.timestamps
    end
  end
end
