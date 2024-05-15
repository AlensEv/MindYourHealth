class AddSymptomsIdToSymptoms < ActiveRecord::Migration[7.1]
  def change
   
    add_column :symptoms, :Symp_id, :integer
  end
end
