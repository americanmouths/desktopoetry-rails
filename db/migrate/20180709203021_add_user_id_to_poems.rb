class AddUserIdToPoems < ActiveRecord::Migration[5.1]
  def change
    add_column :poems, :user_id, :integer
    add_column :poems, :category_id, :integer
  end
end
