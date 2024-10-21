class CreateBodyDiagnoses < ActiveRecord::Migration[6.1]
  def change
    create_table :body_diagnoses do |t|
      t.string :shoulder_line
      t.string :waist_line
      t.string :hip_line
      t.string :leg_length
      t.string :body_type

      t.timestamps
    end
  end
end