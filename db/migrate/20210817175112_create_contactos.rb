class CreateContactos < ActiveRecord::Migration[6.1]
  def change
    create_table :contactos do |t|
      t.string :nombre
      t.string :correo
      t.string :mensaje
      t.integer :status

      t.timestamps
    end
  end
end
