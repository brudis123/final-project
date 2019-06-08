class AddRestaurantToDishes < ActiveRecord::Migration[5.1]
  def change
    add_column :dishes, :restaurant, :string
  end
end
