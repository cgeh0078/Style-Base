class AddQuestion5AndQuestion6ToFashionProfiles < ActiveRecord::Migration[6.1]
  def change
    add_column :fashion_profiles, :question5, :string
    add_column :fashion_profiles, :question6, :string
  end
end
