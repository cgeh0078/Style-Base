class CreateClosets < ActiveRecord::Migration[6.1]
  def change
    create_table :closets do |t|
      t.text :body

      t.timestamps
    end
  end
end
