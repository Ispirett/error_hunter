class CreateDeveloperApps < ActiveRecord::Migration[6.0]
  def change
    create_table :developer_apps do |t|
      t.integer :developer_id
      t.integer :app_id

      t.timestamps
    end
  end
end
