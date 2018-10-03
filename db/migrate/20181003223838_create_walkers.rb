## Move this file into /db/migrate!!

class CreateWalkers < ActiveRecord::Migration[5.2]
  def change
    create_table :walkers do |t|
      t.string :name, null: false
    end
  end
end
