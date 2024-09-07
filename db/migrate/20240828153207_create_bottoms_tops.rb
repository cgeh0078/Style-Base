class CreateBottomsTops < ActiveRecord::Migration[6.1]
  def change
    create_table :bottoms_tops do |t|
      t.references :top, null: false, foreign_key: true
      t.references :bottom, null: false, foreign_key: true

      t.timestamps
    end
  end
end
