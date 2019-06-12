class AddPhotoToDishes < ActiveRecord::Migration[5.1]
  def change
    add_column :dishes, :photo, :string
  end
end
