class CreateComents < ActiveRecord::Migration[6.0]
  def change
    create_table :coments do |t|

      t.timestamps
    end
  end
end
