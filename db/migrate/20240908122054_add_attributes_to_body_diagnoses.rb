class AddAttributesToBodyDiagnoses < ActiveRecord::Migration[6.1]
  def change
    add_column :body_diagnoses, :shoulder_line, :string
    add_column :body_diagnoses, :waist_line, :string
    add_column :body_diagnoses, :hip_line, :string
    add_column :body_diagnoses, :leg_length, :string
    add_column :body_diagnoses, :body_type, :string
  end
end
