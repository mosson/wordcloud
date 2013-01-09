class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.text :source

      t.timestamps
    end
  end
end
