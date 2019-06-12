class AddDishIdToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :dish_id, :integer
  end
end
