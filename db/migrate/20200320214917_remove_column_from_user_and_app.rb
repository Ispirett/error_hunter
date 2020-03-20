class RemoveColumnFromUserAndApp < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :app_id, :integer
    remove_column :apps, :developer_id, :integer
  end
end
