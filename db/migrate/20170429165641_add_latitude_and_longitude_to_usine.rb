class AddLatitudeAndLongitudeToUsine < ActiveRecord::Migration[5.0]
  def change
    add_column :usines, :latitude, :float
    add_column :usines, :longitude, :float
  end
end
