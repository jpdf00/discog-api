class ChangeSizeToBeDecimalInAlbuns < ActiveRecord::Migration[6.1]
  def change
    change_column :albums, :size, :decimal
  end
end
