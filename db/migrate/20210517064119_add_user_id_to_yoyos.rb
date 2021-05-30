class AddUserIdToYoyos < ActiveRecord::Migration[5.2]
  def change
    add_column :yoyos, :user_id, :integer
  end
end
