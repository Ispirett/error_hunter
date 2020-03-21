class CreateAppErrors < ActiveRecord::Migration[6.0]
  def change
    create_table :app_errors do |t|
      t.string :title
      t.string :description
      t.string :serverity
      t.references :app, null: false, foreign_key: true
      t.string :app_name

      t.timestamps
    end
    add_index :app_errors, :app_name
  end
end
