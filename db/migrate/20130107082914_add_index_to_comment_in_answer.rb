class AddIndexToCommentInAnswer < ActiveRecord::Migration
  def change
    add_index :answers, :comment
  end
end
