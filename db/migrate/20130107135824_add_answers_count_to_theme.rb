class AddAnswersCountToTheme < ActiveRecord::Migration
  def change
    add_column :themes, :answers_count, :integer
  end
end
