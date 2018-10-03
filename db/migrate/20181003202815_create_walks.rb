class CreateWalks < ActiveRecord::Migration[5.2]
  def change
    create_table :walks do |t|
      t.string :day, null: false

      t.belongs_to :floof, null: false
      t.belongs_to :walker, null: false
    end
  end
end
