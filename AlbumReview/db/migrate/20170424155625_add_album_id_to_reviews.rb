class AddAlbumIdToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :album_id, :integer
  end
end
