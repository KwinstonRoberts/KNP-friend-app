class ChangeUser3 < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :first_name, :string
    add_column :users, :name, :string
  end
end
