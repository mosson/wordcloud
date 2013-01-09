class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :screen_name
      t.string :name

      t.timestamps
    end
    add_index :users, :provider
    add_index :users, :uid
  end
end
