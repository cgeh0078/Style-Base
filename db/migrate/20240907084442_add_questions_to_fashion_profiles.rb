class AddQuestionsToFashionProfiles < ActiveRecord::Migration[6.1]
  def change
    add_column :fashion_profiles, :question1, :string
    add_column :fashion_profiles, :question2, :string
    add_column :fashion_profiles, :question3, :string
    add_column :fashion_profiles, :question4, :string
    add_column :fashion_profiles, :question5, :string
    add_column :fashion_profiles, :question6, :string
  end
end

