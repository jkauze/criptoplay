class CreateCoins < ActiveRecord::Migration
  def change
    create_table :coins do |t|
      t.string :nombre
      t.references :bet, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
