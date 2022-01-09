class AddThridLoginForUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :facebook_uid, :string
    add_column :users, :facebook_token, :string
    add_column :users, :google_uid, :string
    add_column :users, :google_token, :string
  end
end
