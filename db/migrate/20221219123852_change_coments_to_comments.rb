class ChangeComentsToComments < ActiveRecord::Migration[6.0]
  def change
    rename_table :coments, :comments
  end
end
