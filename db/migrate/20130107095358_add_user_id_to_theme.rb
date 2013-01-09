class AddUserIdToTheme < ActiveRecord::Migration
  def change
    add_column :themes, :user_id, :integer
    add_index :themes, :user_id
  end
end
