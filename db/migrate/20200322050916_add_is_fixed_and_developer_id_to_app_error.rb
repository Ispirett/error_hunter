class AddIsFixedAndDeveloperIdToAppError < ActiveRecord::Migration[6.0]
  def change
    add_column :app_errors, :developer_id, :integer
    add_column :app_errors, :status, :string, default: 'not_solved'
    add_index :app_errors, :status
    add_column :app_errors, :log, :string
  end
end
