class AddUserIdToFashionProfiles < ActiveRecord::Migration[6.1]
  def change
    add_column :fashion_profiles, :user_id, :integer
  end
end
