class ChangeJobTable < ActiveRecord::Migration
  def change
    remove_column :jobs, :company
    rename_column :jobs, :name, :company
    rename_column :jobs, :description, :summary
    add_column :jobs, :specification, :text
  end
end
