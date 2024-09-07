class AddGenreToClosets < ActiveRecord::Migration[6.1]
  def change
    add_column :closets, :genre, :string
  end
end
