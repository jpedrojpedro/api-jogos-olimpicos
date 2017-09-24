class CreateStage < ActiveRecord::Migration[5.0]
  def change
    create_table :stages do |t|
      t.string  :name, limit: 50, null: false
      t.string  :slug, limit: 50, null: false
      t.integer :allowed_batteries, null: false
      t.references :modality, foreign_key: true, null: false

      t.timestamps

      t.index %i[slug modality_id], unique: true,
                                    name: 'idx_unq_slug_on_stage'
      t.index %i[name modality_id], unique: true,
                                    name: 'idx_unq_name_modality_on_step'
    end
  end
end
