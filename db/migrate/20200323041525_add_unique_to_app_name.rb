class AddUniqueToAppName < ActiveRecord::Migration[6.0]
  def change
    remove_index :apps ,:name
    add_index :apps ,:name, unique: true
  end
end
