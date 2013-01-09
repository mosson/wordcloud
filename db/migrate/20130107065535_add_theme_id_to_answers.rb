class AddThemeIdToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :theme_id, :integer
    add_index :answers, :theme_id
  end
end
