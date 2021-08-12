class CreateNotices < ActiveRecord::Migration[6.1]
  def change
    create_table :notices do |t|
      t.string :titulo
      t.string :cuerpo

      t.timestamps
    end
  end
end
