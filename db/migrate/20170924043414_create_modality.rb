class CreateModality < ActiveRecord::Migration[5.0]
  def change
    create_table :modalities do |t|
      t.string :name, limit: 100, null: false
      t.string :slug, limit: 100, null: false
      t.string :measure, limit: 20, null: false

      t.timestamps

      t.index :slug, unique: true, name: 'idx_unq_slug_on_modality'
    end
  end
end
