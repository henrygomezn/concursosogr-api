class CreateConcursos < ActiveRecord::Migration[6.1]
  def change
    create_table :concursos do |t|
      t.string :nombre
      t.string :descripcion
      t.string :bases
    
      
      t.timestamps
    end
  end
end
