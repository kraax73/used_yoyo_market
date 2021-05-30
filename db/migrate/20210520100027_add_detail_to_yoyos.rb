class AddDetailToYoyos < ActiveRecord::Migration[5.2]
  def change
    add_column :yoyos, :detail, :text
  end
end
