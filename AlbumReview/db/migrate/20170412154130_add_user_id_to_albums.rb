class AddUserIdToAlbums < ActiveRecord::Migration[5.0]
  def change
    add_column :albums, :user_id, :integer
  end
end
