class CreateContactAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_admins do |t|
      t.string :address
      t.string :phone
      t.references :admin, foreign_key: true

      t.timestamps
    end
  end
end
