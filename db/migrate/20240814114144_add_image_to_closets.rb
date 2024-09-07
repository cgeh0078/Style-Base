class AddImageToClosets < ActiveRecord::Migration[6.1]
  def change
    add_column :closets, :image, :string
  end
end
