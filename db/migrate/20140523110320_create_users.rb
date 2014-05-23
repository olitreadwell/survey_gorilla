class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username,
               :email,
               :password_hash

    end
  add_index(:users, [:username, :email], unique: true)
  end
end
