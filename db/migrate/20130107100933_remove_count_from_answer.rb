class RemoveCountFromAnswer < ActiveRecord::Migration
  def up
    remove_column :answers, :count
  end

  def down
    add_column :answers, :count, :string
  end
end
