class CreateCompetidors < ActiveRecord::Migration[6.1]
  def change
    create_table :competidors do |t|
      t.string :titulo
      t.string :descripcion
      t.string :autor
      t.string :urlAvatar
      t.string :urlPdf
      t.integer :contVotos
      t.references :usuario, null: false, foreign_key: true
      t.references :concurso, null: false, foreign_key: true
      t.timestamps
    end
  end
end
