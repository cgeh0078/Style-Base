class AddBottomsToClosets < ActiveRecord::Migration[6.1]
  def change
    add_column :closets, :bottoms, :string
  end
end
