class AddPriceToYoyos < ActiveRecord::Migration[5.2]
  def change
    add_column :yoyos, :price, :integer
  end
end
