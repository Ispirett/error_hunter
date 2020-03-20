class AddAppIdToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :app_id, :integer
  end
end
