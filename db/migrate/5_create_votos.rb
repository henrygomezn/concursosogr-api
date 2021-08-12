class CreateVotos < ActiveRecord::Migration[6.1]
  def change
    create_table :votos do |t|
   
      t.integer :usuario_id
      t.references :competidor, null: false, foreign_key: true
      t.references :concurso, null: false, foreign_key: true
      t.timestamps
    end
  end
end
