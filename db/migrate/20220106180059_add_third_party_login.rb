class AddThirdPartyLogin < ActiveRecord::Migration[6.1]
  def change
    create_table :thirds do |t|
      t.references :user, null: true, foreign_key: true
      t.string :fb_uid
      t.string :fb_token
      t.string :google_uid
      t.string :google_token
    end
  end
end
