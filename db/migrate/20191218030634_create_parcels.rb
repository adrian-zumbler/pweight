class CreateParcels < ActiveRecord::Migration[5.2]
  def change
    create_table :parcels do |t|
      t.decimal :length, null: false
      t.decimal :width, null: false
      t.decimal :height, null: false
      t.decimal :weight, null: false
      t.decimal :over_weight
      t.string :distance_unit, null: false
      t.string :mass_unit, null: false
      t.references :package, foreign_key: true, null: false
      t.timestamps
    end
  end
end
