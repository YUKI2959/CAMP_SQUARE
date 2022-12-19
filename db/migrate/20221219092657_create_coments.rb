class CreateComents < ActiveRecord::Migration[6.0]
  def change
    create_table   :coments do |t|
      t.string     :coment,    null: false
      t.references :submit,    null: false, foreign_key: true
      t.references :user,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
