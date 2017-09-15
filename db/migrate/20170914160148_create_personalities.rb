class CreatePersonalities < ActiveRecord::Migration[5.0]
  def change
    create_table :personalities do |t|
      t.string :name
      t.references :result
      t.integer :score
      t.timestamps
    end
  end
end
