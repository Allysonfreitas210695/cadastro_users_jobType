class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.string :name, null: false, default: ''
      t.string :email, null: false, default: ''
      t.string :password_digest, null: false, default: ''
       
      t.timestamps
    end
  end
end
