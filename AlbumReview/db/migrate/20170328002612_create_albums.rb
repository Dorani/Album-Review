class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.string :title
      t.text :description
      t.string :author

      t.timestamps
    end
  end
end
