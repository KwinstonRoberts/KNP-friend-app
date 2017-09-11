class AddPtypeToActivities2 < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :personality_type, :string
    remove_column :activities, :user_id, :string
  end
end
