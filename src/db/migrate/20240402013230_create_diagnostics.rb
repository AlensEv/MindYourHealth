class CreateDiagnostics < ActiveRecord::Migration[7.1]
  def change
    create_table :diagnostics do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :status

      t.timestamps
    end
  end
end
