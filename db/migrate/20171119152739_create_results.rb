class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :coin, index: true, foreign_key: true
      t.string :fecha

      t.timestamps null: false
    end
  end
end
