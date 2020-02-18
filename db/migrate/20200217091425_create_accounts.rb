class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :status
      t.monetize :balance
      t.string :account_number, index: true, unique: true
      t.references :client
    end
  end
end
