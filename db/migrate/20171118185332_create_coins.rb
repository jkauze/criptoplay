class CreateCoins < ActiveRecord::Migration
  def change
    create_table :coins do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
