class AddCompanyIdToUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :companies, null: true, foreign_key: true
  end
end
