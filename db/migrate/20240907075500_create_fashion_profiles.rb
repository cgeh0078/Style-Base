class CreateFashionProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :fashion_profiles do |t|
      t.string :question

      t.timestamps
    end
  end
end
