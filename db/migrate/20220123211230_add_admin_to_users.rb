class AddAdminToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :admin, foreign_key: true, default: 1
  end
end
