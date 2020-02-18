class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :status
      t.string :client_number, index: true, unique: true
    end
  end
end
