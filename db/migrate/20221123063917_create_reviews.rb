class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :text
      t.datetime :time
      t.integer :user_id
      t.integer :attraction_id

      t.timestamps
    end
  end
end
