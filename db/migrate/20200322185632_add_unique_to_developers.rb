class AddUniqueToDevelopers < ActiveRecord::Migration[6.0]
  def change
    add_index :developer_apps, [:developer_id, :app_id], unique: true
  end
end
