class AddImageNameToYoyos < ActiveRecord::Migration[5.2]
  def change
    add_column :yoyos, :image_name, :string
  end
end
