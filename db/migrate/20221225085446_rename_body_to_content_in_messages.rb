class RenameBodyToContentInMessages < ActiveRecord::Migration[6.0]
  def up
    rename_column :messages, :body, :content
  end

  def down
    rename_column :messages, :content, :body
  end
end
