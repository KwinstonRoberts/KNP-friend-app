class ChangeMessages < ActiveRecord::Migration[5.0]
  def change
    change_table :messages do |t|
      t.string :name
      t.string :pImage
    end
  end
end
