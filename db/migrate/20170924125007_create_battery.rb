class CreateBattery < ActiveRecord::Migration[5.0]
  def change
    create_table :batteries do |t|
      t.integer :number, null: false
      t.integer :max_tries, default: 1, null: false
      t.integer :max_athletes, default: 8, null: false
      t.references :stage, foreign_key: true, null: false

      t.timestamps

      t.index %i[number stage_id], unique: true,
                                   name: 'idx_unq_number_on_battery'
    end
  end
end
