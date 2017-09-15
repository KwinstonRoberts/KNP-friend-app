class CreateMigrations < ActiveRecord::Migration[5.0]
  def change
    change_table :activities do |t|
      t.references :users, foreign_key: true
    end
  end
end
