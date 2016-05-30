class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.integer :score
      t.string :sign
      t.string :thumb

      t.timestamps null: false
    end
  end
end
