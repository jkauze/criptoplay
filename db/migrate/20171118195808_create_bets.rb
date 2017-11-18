class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.integer :cantidad
      t.references :user, index: true, foreign_key: true
      t.references :coin, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
