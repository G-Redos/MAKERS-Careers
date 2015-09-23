class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name
      t.string :description
      t.string :status
      t.string :company

      t.integer :roles_available

      t.timestamps null: false
      t.integer :status, default: 0
    end

    add_index :jobs, :status
  end
end
