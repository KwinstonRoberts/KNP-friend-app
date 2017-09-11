class CreateResults < ActiveRecord::Migration[5.0]
  def change
    create_table :results do |t|
      t.string :rank
      t.string :assessment_id
      t.references :user, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
