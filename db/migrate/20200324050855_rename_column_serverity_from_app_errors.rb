class RenameColumnServerityFromAppErrors < ActiveRecord::Migration[6.0]
  def change
    rename_column :app_errors, :serverity, :severity
  end
end
