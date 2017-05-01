class AddPressureToUsines < ActiveRecord::Migration[5.0]
  def change
    add_column :usines, :pressure, :float
  end
end
