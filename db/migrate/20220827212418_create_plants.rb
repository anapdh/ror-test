class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.string :name
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
