class DeviseCreateAdmins < ActiveRecord::Migration
  def change
    create_table(:admins) do |t|
      t.string :email,              null: false, default: ""

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      #OmniAuth
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :auth_token, null: false
      t.string :image_url
      t.string :github_username, null: false

      t.string :name

      t.timestamps
    end

    add_index :admins, :uid,    unique: true
    add_index :admins, :email,  unique: true

    add_index :admins, [:uid, :provider]
  end
end
