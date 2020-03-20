class CreateApps < ActiveRecord::Migration[6.0]
  def change
    create_table :apps do |t|
      t.integer :ceo_id
      t.integer :developer_id
      t.string :name

      t.timestamps
    end
    add_index :apps, :name, unique: true
  end
end
