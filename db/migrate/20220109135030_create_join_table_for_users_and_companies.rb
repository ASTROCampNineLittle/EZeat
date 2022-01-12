class CreateJoinTableForUsersAndCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :comapny, index: true
    end
  end
end
