class AddTrainToDatums < ActiveRecord::Migration[5.1]
  def change
    add_column :data, :train, :string
  end
end
