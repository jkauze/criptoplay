class AddSaldoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :saldo, :double
    add_column :users, :moneda, :string
    add_column :users, :monto, :double
  end
end
