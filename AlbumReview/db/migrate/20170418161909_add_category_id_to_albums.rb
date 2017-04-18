class AddCategoryIdToAlbums < ActiveRecord::Migration[5.0]
  def change
    add_column :albums, :category_id, :integer
  end
end
