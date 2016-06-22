class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.integer :score, default: 100
      t.string :sign, default: '签名是啥？'
      t.boolean :admin, default: false
      t.boolean :deleted, default: false

      t.timestamps null: false
    end
  end
end
