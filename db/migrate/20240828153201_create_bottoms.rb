class CreateBottoms < ActiveRecord::Migration[6.1]
  def change
    create_table :bottoms do |t|
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
