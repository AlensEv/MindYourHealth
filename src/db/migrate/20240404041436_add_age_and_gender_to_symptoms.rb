class AddAgeAndGenderToSymptoms < ActiveRecord::Migration[7.1]
  def change
    add_column :symptoms, :symptoms_id, :integer
    add_column :symptoms, :symptoms, :string
    add_column :symptoms, :Age, :integer
    add_column :symptoms, :Gender, :string
  end
end
