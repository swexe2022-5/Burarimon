class CreateAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :attractions do |t|
      t.string :name
      t.string :prefecture
      t.string :text
      t.string :url
      t.string :genre
      t.string :open_time
      t.string :contact
      t.integer :user_id
      t.datetime :time
      t.string :address

      t.timestamps
    end
  end
end
