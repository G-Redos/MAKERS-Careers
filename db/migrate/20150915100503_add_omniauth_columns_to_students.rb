class AddOmniauthColumnsToStudents < ActiveRecord::Migration
  def change
    change_table(:students) do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :auth_token, null: false
      t.string :image_url
      t.string :github_username, null: false
    end

    add_index :students, :uid,    unique: true
    add_index :students, :email,  unique: true

    add_index :students, [:uid, :provider]
  end
end
