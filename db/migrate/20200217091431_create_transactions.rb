class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :from, foreign_key: { to_table: :accounts }
      t.references :to, foreign_key: { to_table: :accounts }
      t.string :status
      t.monetize :amount
      t.string :transaction_number, index: true, unique: true

    end
  end
end

