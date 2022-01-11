class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nome
      t.string :cpf
      t.integer :idade
      t.string :profissao

      t.timestamps
    end
  end
end
