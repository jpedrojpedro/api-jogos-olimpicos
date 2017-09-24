class CreateResult < ActiveRecord::Migration[5.0]
  def change
    create_table :results do |t|
      t.string  :athlete, limit: 100, null: false
      t.string  :country, limit: 3, null: false
      t.decimal :value, precision: 6, scale: 3, null: false
      t.references :battery, foreign_key: true, null: false

      t.timestamps
    end
  end
end
