class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :comment

      t.timestamps
    end
  end
end
