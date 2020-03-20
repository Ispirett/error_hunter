class CreateErrors < ActiveRecord::Migration[6.0]
  def change
    create_table :errors do |t|
      t.string :title
      t.string :description
      t.string :serverity
      t.references :app, null: false, foreign_key: true

      t.timestamps
    end
  end
end
