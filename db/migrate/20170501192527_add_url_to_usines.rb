class AddUrlToUsines < ActiveRecord::Migration[5.0]
  def change
    add_column :usines, :url, :string
  end
end
