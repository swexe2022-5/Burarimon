class CreateAttractionPictures < ActiveRecord::Migration[5.2]
  def change
    create_table :attraction_pictures do |t|
      t.integer :attraction_id
      t.binary :picture

      t.timestamps
    end
  end
end
