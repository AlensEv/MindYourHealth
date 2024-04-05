class StuffToAdd < ActiveRecord::Migration[7.1]
  def change
    change_column :symptoms, :Symp_id, :string
  end
end
