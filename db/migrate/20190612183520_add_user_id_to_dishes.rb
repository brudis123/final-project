class AddUserIdToDishes < ActiveRecord::Migration[5.1]
  def change
    add_column :dishes, :user_id, :integer
  end
end
