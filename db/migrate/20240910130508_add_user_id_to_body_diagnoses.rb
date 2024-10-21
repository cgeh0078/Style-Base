class AddUserIdToBodyDiagnoses < ActiveRecord::Migration[6.1]
  def change
    add_column :body_diagnoses, :user_id, :integer
  end
end
