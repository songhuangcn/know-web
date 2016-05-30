class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.text :content
      t.string :category
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
