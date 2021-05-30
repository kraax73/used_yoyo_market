class AddImageToYoyos < ActiveRecord::Migration[5.2]
  def change
    remove_column :yoyos, :image, :string
  end
end
