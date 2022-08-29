class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :name
      t.integer :plantation_area
      t.string :plant_specie
      t.integer :plants_number
      t.integer :plants_row_spacing
      t.integer :plants_column_spacing
      t.references :contact, foreign_key: true

      t.timestamps
    end
  end
end
