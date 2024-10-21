class AddAttributesToColorDiagnoses < ActiveRecord::Migration[6.1]
  def change
    add_column :color_diagnoses, :skin_tone, :string
    add_column :color_diagnoses, :eye_color, :string
    add_column :color_diagnoses, :hair_color, :string
    add_column :color_diagnoses, :sunburn_reaction, :string
    add_column :color_diagnoses, :color_preference, :string
    add_column :color_diagnoses, :accessory_color, :string
    add_column :color_diagnoses, :clothing_color, :string
  end
end
