class CreateUsuarios < ActiveRecord::Migration[6.1]
  def change
    create_table :usuarios do |t|
      t.string :correo
      t.string :password_digest
      t.string :username
      t.string :rut
      t.string :sexo
      t.string :telefono
      t.string :curso
      t.references :rol, null: false, foreign_key: true
   
      
      t.timestamps
    end
  end
end
