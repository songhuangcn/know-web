class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.text :content
      t.string :category, default: '瞎扯淡'
      t.integer :view_count, default: 0
      t.integer :reply_count, default: 0
      t.integer :like_count, default: 0
      t.boolean :essence, default: false
      t.boolean :deleted, default: false


      t.references :user, index: true, foreign_key: true


      t.timestamps null: false
    end
  end
end
