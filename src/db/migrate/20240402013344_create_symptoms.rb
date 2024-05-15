class CreateSymptoms < ActiveRecord::Migration[7.1]
  def change
    create_table :symptoms do |t|
      t.references :diagnostics, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
