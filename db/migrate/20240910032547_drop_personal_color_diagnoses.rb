class DropPersonalColorDiagnoses < ActiveRecord::Migration[6.1]
  def change
    drop_table :personal_color_diagnoses
  end
end