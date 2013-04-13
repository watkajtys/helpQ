class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.references :user
      t.text :description
      t.integer :position

      t.timestamps
    end
    add_index :tickets, :user_id
  end
end
