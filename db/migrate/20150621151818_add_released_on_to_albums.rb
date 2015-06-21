class AddReleasedOnToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :released_on, :date
  end
end
