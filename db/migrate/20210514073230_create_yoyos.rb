class CreateYoyos < ActiveRecord::Migration[5.2]
  def change
    create_table :yoyos do |t|
      t.string :name

      t.timestamps
    end
  end
end
