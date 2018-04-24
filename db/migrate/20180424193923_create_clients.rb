class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :phone
      t.string :code

      t.timestamps
    end
  end
end
