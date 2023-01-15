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
      t.binary :picture1
      t.binary :picture2
      t.binary :picture3
      t.binary :picture4
      t.binary :picture5
      t.binary :picture6

      t.timestamps
    end
  end
end
