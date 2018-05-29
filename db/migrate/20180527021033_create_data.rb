class CreateData < ActiveRecord::Migration[5.1]
  def change
    create_table :data do |t|
      t.float :lat
      t.float :lng
      t.integer :speed

      t.timestamps
    end
  end
end
