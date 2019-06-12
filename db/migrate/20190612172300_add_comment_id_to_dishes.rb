class AddCommentIdToDishes < ActiveRecord::Migration[5.1]
  def change
    add_column :dishes, :comment_id, :integer
  end
end
