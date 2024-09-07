class AddTopsToClosets < ActiveRecord::Migration[6.1]
  def change
    add_column :closets, :tops, :string
  end
end
