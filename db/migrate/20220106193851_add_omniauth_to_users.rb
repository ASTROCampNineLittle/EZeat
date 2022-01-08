class AddOmniauthToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :image, :string
    add_reference :thirds, :user, foreign_key: true
  end
end
