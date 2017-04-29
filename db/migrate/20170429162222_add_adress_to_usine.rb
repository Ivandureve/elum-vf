class AddAdressToUsine < ActiveRecord::Migration[5.0]
  def change
    add_column :usines, :zip, :string
    add_column :usines, :city, :string
    add_column :usines, :country, :string
  end
end
