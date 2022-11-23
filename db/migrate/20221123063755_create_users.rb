class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :pass
      t.string :profile
      t.binary :icon
      t.boolean :owner

      t.timestamps
    end
  end
end
